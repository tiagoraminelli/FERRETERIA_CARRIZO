<?php

namespace App\Controller;

use App\Entity\Categoria;
use App\Entity\Productos;
use App\Form\ProductosType;
use App\Repository\CategoriaRepository;
use App\Repository\ProductosRepository;
use App\Service\ProductosExcelImporter;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Picqer\Barcode\BarcodeGeneratorSVG;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\String\Slugger\SluggerInterface;


#[Route('/productos')]
final class ProductosController extends AbstractController
{



    #[Route('/export-pdf', name: 'app_productos_export_pdf', methods: ['GET'])]
    public function exportPdf(
        Request $request,
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository
    ): Response {
        $search = $request->query->get('search');
        $categoriaId = $request->query->get('categoria');

        $queryBuilder = $productosRepository->createQueryBuilder('p')
            ->leftJoin('p.categoria', 'c')
            ->addSelect('c');

        if ($search) {
            $queryBuilder
                ->where('p.nombre LIKE :search')
                ->orWhere('p.descripcion LIKE :search')
                ->orWhere('p.codigo_barra LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($categoriaId && $categoriaId !== '') {
            $queryBuilder
                ->andWhere('p.categoria = :categoriaId')
                ->setParameter('categoriaId', $categoriaId);
        }

        $productos = $queryBuilder->orderBy('p.nombre', 'ASC')->getQuery()->getResult();

        $barcodeGenerator = new BarcodeGeneratorSVG();
        $barcodeData = [];

        foreach ($productos as $producto) {
            if ($producto->getCodigoBarra()) {
                $barcodeData[$producto->getId()] = base64_encode(
                    $barcodeGenerator->getBarcode($producto->getCodigoBarra(), $barcodeGenerator::TYPE_CODE_128)
                );
            }
        }

        return $this->render('productos/export_pdf.html.twig', [
            'productos' => $productos,
            'barcode_data' => $barcodeData,
            'fecha' => (new \DateTime())->format('d/m/Y H:i'),
            'filtros' => [
                'search' => $search,
                'categoria' => $categoriaId ? $categoriaRepository->find($categoriaId)?->getNombre() : 'Todas'
            ],
            'total' => count($productos)
        ]);
    }

    #[Route('/{id}/barcode', name: 'app_productos_barcode', methods: ['GET'])]
    public function barcode(Productos $producto): Response
    {

        $codigoBarra = $producto->getCodigoBarra();

        if (!$codigoBarra) {
            throw $this->createNotFoundException('El producto no tiene código de barras');
        }

        $generator = new BarcodeGeneratorSVG();
        $barcode = $generator->getBarcode($codigoBarra, $generator::TYPE_CODE_128);

        return new Response($barcode, 200, [
            'Content-Type' => 'image/svg+xml',
            'Content-Disposition' => 'inline; filename="barcode-' . $producto->getId() . '.svg"'
        ]);
    }

    #[Route('/bulk-fetch', name: 'app_productos_bulk_fetch', methods: ['GET'])]
    public function bulkFetch(
        Request $request,
        ProductosRepository $productosRepository
    ): Response {
        $search = $request->query->get('search');
        $categoriaId = $request->query->get('categoria');

        $qb = $productosRepository->createQueryBuilder('p')
            ->leftJoin('p.categoria', 'c')
            ->addSelect('c');

        if ($search) {
            $qb->andWhere('p.nombre LIKE :search OR p.descripcion LIKE :search')
                ->setParameter('search', "%{$search}%");
        }

        if ($categoriaId && $categoriaId !== '') {
            $qb->andWhere('p.categoria = :categoria')
                ->setParameter('categoria', $categoriaId);
        }

        $productos = $qb->orderBy('p.id', 'DESC')->getQuery()->getResult();

        $data = [];
        foreach ($productos as $p) {
            $data[] = [
                'id' => $p->getId(),
                'nombre' => $p->getNombre(),
                'descripcion' => $p->getDescripcion(),
                'categoria' => $p->getCategoria() ? $p->getCategoria()->getNombre() : null,
                'stock' => $p->getStock(),
                'precioCosto' => $p->getPrecioCosto(),
                'precio' => $p->getPrecio(),
                'activo' => $p->isActivo(),
            ];
        }

        return $this->json(['productos' => $data]);
    }

    #[Route('/bulk-update', name: 'app_productos_bulk_update', methods: ['GET'])]
    public function bulkUpdate(
        Request $request,
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository
    ): Response {
        $search = $request->query->get('search');
        $categoriaId = $request->query->get('categoria');

        $queryBuilder = $productosRepository->createQueryBuilder('p')
            ->leftJoin('p.categoria', 'c')
            ->addSelect('c');

        if ($search) {
            $queryBuilder
                ->andWhere('p.nombre LIKE :search OR p.descripcion LIKE :search')
                ->setParameter('search', "%{$search}%");
        }

        if ($categoriaId && $categoriaId !== '') {
            $queryBuilder
                ->andWhere('p.categoria = :categoria')
                ->setParameter('categoria', $categoriaId);
        }

        $productos = $queryBuilder->orderBy('p.id', 'DESC')->getQuery()->getResult();
        $categorias = $categoriaRepository->findAll();

        return $this->render('productos/bulk_update.html.twig', [
            'productos' => $productos,
            'categorias' => $categorias,
            'search' => $search,
            'categoriaId' => $categoriaId,
            'breadcrumbs' => [
                ['label' => 'Productos', 'url' => $this->generateUrl('app_productos_index')],
                ['label' => 'Actualización Masiva', 'url' => '']
            ],
        ]);
    }

    #[Route('/bulk-update-categoria', name: 'app_productos_bulk_update_categoria', methods: ['POST'])]
    public function bulkUpdateCategoria(
        Request $request,
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository,
        EntityManagerInterface $entityManager
    ): Response {
        if (!$this->isCsrfTokenValid('bulk_update_categoria', $request->request->get('_token'))) {
            $this->addFlash('danger', 'Token inválido');
            return $this->redirectToRoute('app_productos_bulk_update');
        }

        $categoriaId = $request->request->get('categoria_id');
        $tipoAccion = $request->request->get('tipo_accion');
        $valor = $request->request->get('valor');

        if (!$categoriaId) {
            $this->addFlash('danger', 'Debe seleccionar una categoría');
            return $this->redirectToRoute('app_productos_bulk_update');
        }

        $productos = $productosRepository->createQueryBuilder('p')
            ->where('p.categoria = :categoria')
            ->setParameter('categoria', $categoriaId)
            ->getQuery()
            ->getResult();

        if (count($productos) === 0) {
            $this->addFlash('warning', 'No hay productos en esta categoría');
            return $this->redirectToRoute('app_productos_bulk_update');
        }

        $contador = 0;

        foreach ($productos as $producto) {
            switch ($tipoAccion) {
                case 'precio_porcentaje':
                    $producto->setPrecio($producto->getPrecio() * (1 + floatval($valor) / 100));
                    break;
                case 'precio_descuento':
                    $producto->setPrecio($producto->getPrecio() * (1 - floatval($valor) / 100));
                    break;
                case 'precio_fijo':
                    $producto->setPrecio(floatval($valor));
                    break;
                case 'precio_incremento_fijo':
                    $producto->setPrecio($producto->getPrecio() + floatval($valor));
                    break;
                case 'precio_decremento_fijo':
                    $producto->setPrecio($producto->getPrecio() - floatval($valor));
                    break;
                case 'stock_incrementar':
                    $producto->setStock($producto->getStock() + floatval($valor));
                    break;
                case 'stock_decrementar':
                    $producto->setStock($producto->getStock() - floatval($valor));
                    break;
                case 'stock_fijo':
                    $producto->setStock(floatval($valor));
                    break;
                case 'estado_activar':
                    $producto->setActivo(true);
                    break;
                case 'estado_desactivar':
                    $producto->setActivo(false);
                    break;
            }
            $contador++;
        }

        $entityManager->flush();

        $this->addFlash('success', "{$contador} productos actualizados correctamente");
        return $this->redirectToRoute('app_productos_bulk_update');
    }

    #[Route('/bulk-update-individual', name: 'app_productos_bulk_update_individual', methods: ['POST'])]
    public function bulkUpdateIndividual(
        Request $request,
        ProductosRepository $productosRepository,
        EntityManagerInterface $entityManager
    ): Response {
        if (!$this->isCsrfTokenValid('bulk_update_individual', $request->request->get('_token'))) {
            if ($request->isXmlHttpRequest()) {
                return $this->json(['success' => false, 'message' => 'Token inválido']);
            }
            $this->addFlash('danger', 'Token inválido');
            return $this->redirectToRoute('app_productos_bulk_update');
        }

        $ids = $request->request->all('id');
        $stocks = $request->request->all('stock');
        $preciosCosto = $request->request->all('precio_costo');
        $precios = $request->request->all('precio');
        $activos = $request->request->all('activo');

        $contador = 0;

        foreach ($ids as $index => $id) {
            $producto = $productosRepository->find($id);

            if ($producto) {
                if (isset($stocks[$id]) && $stocks[$id] !== '') {
                    $producto->setStock((float) $stocks[$id]);
                }

                if (isset($preciosCosto[$id]) && $preciosCosto[$id] !== '') {
                    $producto->setPrecioCosto((float) $preciosCosto[$id]);
                }

                if (isset($precios[$id]) && $precios[$id] !== '') {
                    $producto->setPrecio((float) $precios[$id]);
                }

                $producto->setActivo(isset($activos[$id]));

                $contador++;
            }
        }

        $entityManager->flush();

        if ($request->isXmlHttpRequest()) {
            return $this->json(['success' => true, 'message' => "{$contador} productos actualizados correctamente"]);
        }

        $this->addFlash('success', "{$contador} productos actualizados correctamente");
        return $this->redirectToRoute('app_productos_bulk_update');
    }

    #[Route('/import', name: 'app_productos_import', methods: ['GET', 'POST'])]
    public function import(
        Request $request,
        ProductosExcelImporter $excelImporter
    ): Response {
        if ($request->isMethod('POST')) {
            /** @var UploadedFile|null $file */
            $file = $request->files->get('excel_file');

            if (!$file) {
                $this->addFlash('danger', 'Debes seleccionar un archivo Excel.');
                return $this->redirectToRoute('app_productos_import');
            }

            $allowedExtensions = ['xlsx', 'xls', 'csv'];
            if (!in_array(strtolower($file->getClientOriginalExtension()), $allowedExtensions)) {
                $this->addFlash('danger', 'Formato no válido. Usa xlsx, xls o csv.');
                return $this->redirectToRoute('app_productos_import');
            }

            $uploadDir = $this->getParameter('kernel.project_dir') . '/var/imports';
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            $newFilename = uniqid('import_') . '.' . $file->guessExtension();
            $file->move($uploadDir, $newFilename);
            $filePath = $uploadDir . '/' . $newFilename;

            try {
                $result = $excelImporter->import($filePath);

                if ($result['success'] > 0) {
                    $this->addFlash('success', "{$result['success']} productos importados correctamente.");
                }
                foreach ($result['errors'] as $error) {
                    $this->addFlash('warning', $error);
                }
                if ($result['success'] === 0 && empty($result['errors'])) {
                    $this->addFlash('warning', 'No se encontraron datos para importar.');
                }
            } catch (\Exception $e) {
                $this->addFlash('danger', 'Error al procesar el Excel: ' . $e->getMessage());
            } finally {
                if (file_exists($filePath)) {
                    unlink($filePath);
                }
            }

            return $this->redirectToRoute('app_productos_index');
        }

        return $this->render('productos/import.html.twig', [
            'breadcrumbs' => [
                ['label' => 'Productos', 'url' => $this->generateUrl('app_productos_index')],
                ['label' => 'Importar Excel', 'url' => '']
            ],
        ]);
    }


    #[Route('/import/plantilla', name: 'app_productos_import_plantilla', methods: ['GET'])]
    public function importPlantilla(): Response
    {
        $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Encabezados
        $sheet->setCellValue('A1', 'Nombre');
        $sheet->setCellValue('B1', 'Descripción');
        $sheet->setCellValue('C1', 'Precio');
        $sheet->setCellValue('D1', 'Costo');
        $sheet->setCellValue('E1', 'Stock');
        $sheet->setCellValue('F1', 'Categoría');
        $sheet->setCellValue('G1', 'Código de Barra');

        // Estilos de encabezado
        $sheet->getStyle('A1:G1')->getFont()->setBold(true);
        $sheet->getStyle('A1:G1')->getFill()
            ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
            ->getStartColor()->setARGB('FFE0E0E0');

        // Anchos de columna
        $sheet->getColumnDimension('A')->setWidth(25);
        $sheet->getColumnDimension('B')->setWidth(35);
        $sheet->getColumnDimension('C')->setWidth(12);
        $sheet->getColumnDimension('D')->setWidth(12);
        $sheet->getColumnDimension('E')->setWidth(10);
        $sheet->getColumnDimension('F')->setWidth(20);
        $sheet->getColumnDimension('G')->setWidth(20);

        // Nombre del archivo: AAAAMMDD_HHMMSS_productos.xlsx
        $filename = (new \DateTime())->format('Ymd_His') . '_productos.xlsx';

        // Enviar al navegador
        $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);

        $response = new Response();
        $response->headers->set('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        $response->headers->set('Content-Disposition', 'attachment; filename="' . $filename . '"');
        $response->headers->set('Cache-Control', 'max-age=0');

        ob_start();
        $writer->save('php://output');
        $content = ob_get_clean();

        $response->setContent($content);

        $spreadsheet->disconnectWorksheets();

        return $response;
    }

    #[Route('/{id}/restaurar/{historialId}', name: 'app_productos_restaurar', methods: ['POST'])]
    public function restaurarVersion(
        Productos $producto,
        int $historialId,
        Request $request,
        EntityManagerInterface $entityManager
    ): Response {
        if (!$this->isCsrfTokenValid('restaurar' . $producto->getId(), $request->request->get('_token'))) {
            $this->addFlash('danger', 'Token inválido');
            return $this->redirectToRoute('app_productos_show', ['id' => $producto->getId()]);
        }

        $conn = $entityManager->getConnection();
        $historial = $conn->fetchAssociative(
            'SELECT * FROM productos_historial WHERE id = :id AND producto_id = :producto_id',
            ['id' => $historialId, 'producto_id' => $producto->getId()]
        );

        if (!$historial) {
            throw $this->createNotFoundException('Versión no encontrada para este producto');
        }

        $producto->setNombre($historial['nombre']);
        $producto->setDescripcion($historial['descripcion']);
        $producto->setPrecio((string)($historial['precio'] ?? '0'));
        $producto->setPrecioCosto($historial['precio_costo'] !== null ? (string)$historial['precio_costo'] : null);
        $producto->setStock((string)($historial['stock'] ?? '0'));
        $producto->setImagen($historial['imagen']);
        $producto->setActivo((bool)($historial['activo'] ?? false));
        $producto->setCodigoBarra($historial['codigo_barra']);

        if (!empty($historial['categoria_id'])) {
            $categoria = $entityManager->getRepository(Categoria::class)->find($historial['categoria_id']);
            $producto->setCategoria($categoria);
        } else {
            $producto->setCategoria(null);
        }

        $entityManager->flush();

        $this->addFlash('success', 'Producto restaurado a la versión del ' . $historial['created_at']);
        return $this->redirectToRoute('app_productos_show', ['id' => $producto->getId()]);
    }

    #[Route(name: 'app_productos_index', methods: ['GET'])]
    public function index(
        Request $request,
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $categoriaId = $request->query->get('categoria');

        $queryBuilder = $productosRepository->createQueryBuilder('p');

        if ($search) {
            $queryBuilder
                ->where('p.nombre LIKE :search')
                ->orWhere('p.descripcion LIKE :search')
                ->orWhere('p.codigo_barra LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($categoriaId && $categoriaId !== '') {
            $queryBuilder
                ->andWhere('p.categoria = :categoriaId')
                ->setParameter('categoriaId', $categoriaId);
        }

        $queryBuilder->orderBy('p.id', 'DESC');

        $productos = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            5
        );

        // Obtener todas las categorías para el select
        $categorias = $categoriaRepository->findAll();

        $breadcrumbs = [
            ['label' => 'Productos', 'url' => '']
        ];

        return $this->render('productos/index.html.twig', [
            'productos' => $productos,
            'breadcrumbs' => $breadcrumbs,
            'search' => $search,
            'categoriaId' => $categoriaId,
            'categorias' => $categorias,
        ]);
    }



    #[Route('/new', name: 'app_productos_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $producto = new Productos();

        # Por defecto el producto se crea como activo
        $producto->setActivo(true);

        $form = $this->createForm(ProductosType::class, $producto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            # Subir imagen
            $imagenFile = $form->get('imagen')->getData();

            if ($imagenFile) {
                $originalFilename = pathinfo($imagenFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $imagenFile->guessExtension();

                try {
                    $imagenFile->move(
                        $this->getParameter('kernel.project_dir') . '/public/uploads/productos',
                        $newFilename
                    );
                    $producto->setImagen($newFilename);
                } catch (FileException $e) {
                    $this->addFlash('danger', 'Error al subir la imagen: ' . $e->getMessage());
                }
            }

            // Guardar producto para obtener el ID
            $entityManager->persist($producto);
            $entityManager->flush();

            // Generar código de barras basado en categoría e ID
            $categoriaId = $producto->getCategoria() ? $producto->getCategoria()->getId() : 0;
            $codigoBarra = str_pad($categoriaId, 3, '0', STR_PAD_LEFT) . str_pad($producto->getId(), 9, '0', STR_PAD_LEFT);
            $producto->setCodigoBarra($codigoBarra);

            $entityManager->flush();

            $this->addFlash('success', 'Producto creado correctamente');

            return $this->redirectToRoute('app_productos_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Productos', 'url' => $this->generateUrl('app_productos_index')],
            ['label' => 'Crear Producto', 'url' => '']
        ];

        return $this->render('productos/new.html.twig', [
            'producto' => $producto,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_productos_show', methods: ['GET'])]
    public function show(Productos $producto, EntityManagerInterface $entityManager): Response
    {
        $conn = $entityManager->getConnection();

        $historial = $conn->fetchAllAssociative(
            'SELECT * FROM productos_historial WHERE producto_id = :id ORDER BY created_at DESC',
            ['id' => $producto->getId()]
        );

        $breadcrumbs = [
            ['label' => 'Productos', 'url' => $this->generateUrl('app_productos_index')],
            ['label' => 'Ver: ' . ($producto->getNombre() ?? $producto->getId()), 'url' => '']
        ];

        return $this->render('productos/show.html.twig', [
            'producto'   => $producto,
            'historial'  => $historial,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_productos_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Productos $producto, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {

        // Guardar imagen actual para comparar después
        $imagenActual = $producto->getImagen();

        $form = $this->createForm(ProductosType::class, $producto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            // Subir nueva imagen
            $imagenFile = $form->get('imagen')->getData();

            if ($imagenFile) {
                // Eliminar imagen anterior si existe
                if ($imagenActual) {
                    $rutaAnterior = $this->getParameter('kernel.project_dir') . '/public/uploads/productos/' . $imagenActual;
                    if (file_exists($rutaAnterior)) {
                        unlink($rutaAnterior);
                    }
                }

                $originalFilename = pathinfo($imagenFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $imagenFile->guessExtension();

                try {
                    $imagenFile->move(
                        $this->getParameter('kernel.project_dir') . '/public/uploads/productos',
                        $newFilename
                    );
                    $producto->setImagen($newFilename);
                } catch (FileException $e) {
                    $this->addFlash('danger', 'Error al subir la imagen: ' . $e->getMessage());
                }
            }

            // Si no se subió nueva imagen y el campo está vacío, eliminar la imagen existente
            if (!$imagenFile && $form->get('eliminar_imagen')->getData()) {
                if ($imagenActual) {
                    $rutaAnterior = $this->getParameter('kernel.project_dir') . '/public/uploads/productos/' . $imagenActual;
                    if (file_exists($rutaAnterior)) {
                        unlink($rutaAnterior);
                    }
                    $producto->setImagen(null);
                }
            }

            $entityManager->flush();

            $this->addFlash('success', 'Producto actualizado correctamente');

            return $this->redirectToRoute('app_productos_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Productos', 'url' => $this->generateUrl('app_productos_index')],
            ['label' => 'Editar: ' . ($producto->getNombre() ?? $producto->getId()), 'url' => '']
        ];

        return $this->render('productos/edit.html.twig', [
            'producto' => $producto,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_productos_delete', methods: ['POST'])]
    public function delete(Request $request, Productos $producto, EntityManagerInterface $entityManager): Response
    {
        $token = $request->getPayload()->getString('_token');

        if ($this->isCsrfTokenValid('delete' . $producto->getId(), $token)) {
            try {
                $entityManager->remove($producto);
                $entityManager->flush();
                $this->addFlash('success', 'Producto eliminado correctamente');
            } catch (\Exception $e) {
                $this->addFlash('danger', 'Error al eliminar: ' . $e->getMessage());
            }
        } else {
            $this->addFlash('danger', 'Token CSRF inválido');
        }

        return $this->redirectToRoute('app_productos_index', [], Response::HTTP_SEE_OTHER);
    }
}
