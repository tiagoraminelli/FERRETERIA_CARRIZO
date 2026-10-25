<?php

namespace App\Service;

use App\Entity\Productos;
use App\Repository\CategoriaRepository;
use Doctrine\ORM\EntityManagerInterface;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ProductosExcelImporter
{
    public function __construct(
        private EntityManagerInterface $entityManager,
        private CategoriaRepository $categoriaRepository
    ) {}

    /**
     * @return array{success: int, errors: array<string>}
     */
    public function import(string $filePath): array
    {
        $spreadsheet = IOFactory::load($filePath);
        $sheet = $spreadsheet->getActiveSheet();
        $rows = $sheet->toArray(null, true, true, true);

        $successCount = 0;
        $errors = [];

        // Columnas: A nombre, B descripcion, C precio, D precio_costo,
        //           E stock, F categoria_nombre, G codigo_barra

        $firstRow = true;
        foreach ($rows as $rowIndex => $row) {
            if ($firstRow) {
                $firstRow = false;
                continue;
            }

            if (empty(array_filter($row))) {
                continue;
            }

            try {
                $producto = new Productos();

                $nombre = trim((string)($row['A'] ?? ''));
                if ($nombre === '') {
                    $errors[] = "Fila {$rowIndex}: El nombre es obligatorio.";
                    continue;
                }
                $producto->setNombre($nombre);

                $producto->setDescripcion(!empty($row['B']) ? trim((string)$row['B']) : null);

                $precioRaw = $row['C'] ?? null;
                if ($precioRaw === null || $precioRaw === '') {
                    $errors[] = "Fila {$rowIndex}: El precio es obligatorio.";
                    continue;
                }
                $precioLimpio = str_replace([',', '$', ' '], '', (string)$precioRaw);
                if (!is_numeric($precioLimpio)) {
                    $errors[] = "Fila {$rowIndex}: El precio '{$precioRaw}' no es numérico.";
                    continue;
                }
                $producto->setPrecio((string)$precioLimpio);

                if (!empty($row['D'])) {
                    $costoLimpio = str_replace([',', '$', ' '], '', (string)$row['D']);
                    if (is_numeric($costoLimpio)) {
                        $producto->setPrecioCosto((string)$costoLimpio);
                    }
                }

                $stockRaw = $row['E'] ?? '0';
                $stockLimpio = str_replace(',', '.', (string)$stockRaw);
                $producto->setStock((string)(float)$stockLimpio);

                // Categoría por nombre (se crea si no existe)
                $categoriaNombre = trim((string)($row['F'] ?? ''));
                if ($categoriaNombre !== '') {
                    // Búsqueda flexible: sin distinguir mayúsculas/minúsculas ni tildes
                    $categoria = $this->findCategoriaByNombreFlexible($categoriaNombre);

                    if (!$categoria) {
                        $categoria = new \App\Entity\Categoria();
                        $categoria->setNombre($categoriaNombre);
                        $categoria->setActivo(true);
                        $categoria->setCreatedAt(new \DateTimeImmutable());
                        $categoria->setUpdatedAt(new \DateTimeImmutable());
                        $this->entityManager->persist($categoria);
                        // flush diferido: Doctrine lo inserta junto con los productos al final
                    }

                    $producto->setCategoria($categoria);
                }

                if (!empty($row['G'])) {
                    $producto->setCodigoBarra(trim((string)$row['G']));
                }

                $producto->setActivo(true);
                $producto->setCreatedAt(new \DateTimeImmutable());
                $producto->setUpdatedAt(new \DateTimeImmutable());

                $this->entityManager->persist($producto);
                $successCount++;
            } catch (\Exception $e) {
                $errors[] = "Fila {$rowIndex}: " . $e->getMessage();
            }
        }

        $this->entityManager->flush();

        return ['success' => $successCount, 'errors' => $errors];
    }

    private function findCategoriaByNombreFlexible(string $nombre): ?\App\Entity\Categoria
    {
        // Normaliza: minúsculas, sin tildes, sin espacios extra
        $normalizar = function (string $s): string {
            $s = mb_strtolower(trim($s));
            $s = str_replace(
                ['á', 'é', 'í', 'ó', 'ú', 'ü', 'ñ'],
                ['a', 'e', 'i', 'o', 'u', 'u', 'n'],
                $s
            );
            return $s;
        };

        $objetivo = $normalizar($nombre);

        foreach ($this->categoriaRepository->findAll() as $cat) {
            if ($normalizar((string)$cat->getNombre()) === $objetivo) {
                return $cat;
            }
        }

        return null;
    }
}
