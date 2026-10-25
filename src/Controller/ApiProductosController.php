<?php

namespace App\Controller;

use App\Repository\ProductosRepository;
use App\Repository\CategoriaRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/api/productos')]
class ApiProductosController extends AbstractController
{
    #[Route('/buscar', name: 'api_productos_buscar', methods: ['GET'])]
    public function buscar(
        Request $request,
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $categoria = $request->query->get('categoria');
        $page = $request->query->getInt('page', 1);

        $queryBuilder = $productosRepository->createQueryBuilder('p')
            ->leftJoin('p.categoria', 'c')
            ->addSelect('c')
            ->andWhere('p.activo = :activo')
            ->setParameter('activo', true);

        if ($search) {
            $queryBuilder
                ->andWhere('p.nombre LIKE :search OR p.codigo_barra LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($categoria && $categoria !== '') {
            $queryBuilder
                ->andWhere('p.categoria = :categoria')
                ->setParameter('categoria', $categoria);
        }

        $queryBuilder->orderBy('p.nombre', 'ASC');

        $productos = $paginator->paginate($queryBuilder, $page, 10);

        $items = array();
        foreach ($productos as $p) {
            $items[] = array(
                'id' => $p->getId(),
                'nombre' => $p->getNombre(),
                'precio' => $p->getPrecio(),
                'stock' => $p->getStock()
            );
        }

        return $this->json(array(
            'items' => $items,
            'total' => $productos->getTotalItemCount(),
            'page' => $productos->getCurrentPageNumber(),
            'pageCount' => $productos->getPageCount()
        ));
    }
}
