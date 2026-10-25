<?php

namespace App\Controller;

use App\Entity\PresupuestosDetalle;
use App\Repository\PresupuestosRepository;
use App\Entity\Presupuestos;
use App\Form\PresupuestosDetalleType;
use App\Repository\ProductosRepository;
use App\Repository\PresupuestosDetalleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/presupuestos/detalle')]
final class PresupuestosDetalleController extends AbstractController
{
    #[Route(name: 'app_presupuestos_detalle_index', methods: ['GET'])]
    public function index(
        Request $request,
        PresupuestosDetalleRepository $presupuestosDetalleRepository,
        PaginatorInterface $paginator
    ): Response {
        $queryBuilder = $presupuestosDetalleRepository->createQueryBuilder('d')
            ->leftJoin('d.presupuesto', 'p')
            ->leftJoin('d.producto', 'pr')
            ->addSelect('p', 'pr')
            ->orderBy('d.id', 'DESC');

        $presupuestos_detalles = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $breadcrumbs = [
            ['label' => 'Detalle Presupuestos', 'url' => '']
        ];

        return $this->render('presupuestos_detalle/index.html.twig', [
            'presupuestos_detalles' => $presupuestos_detalles,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }


    # Nuevos Presupuestos Detalles

    #[Route('/new', name: 'app_presupuestos_detalle_new', methods: array('GET', 'POST'))]
    public function new(
        Request $request,
        EntityManagerInterface $entityManager,
        PresupuestosRepository $presupuestosRepository
    ): Response {
        $presupuestoId = $request->query->get('presupuesto');
        $presupuesto = null;

        if ($presupuestoId) {
            $presupuesto = $presupuestosRepository->find($presupuestoId);
        }

        $presupuestos = $presupuestosRepository->findBy(array(), array('id' => 'DESC'));

        $breadcrumbs = array(
            array('label' => 'Detalle Presupuestos', 'url' => $this->generateUrl('app_presupuestos_detalle_index')),
            array('label' => 'Agregar Productos', 'url' => '')
        );

        return $this->render('presupuestos_detalle/new.html.twig', array(
            'presupuestos' => $presupuestos,
            'presupuesto_seleccionado' => $presupuesto,
            'breadcrumbs' => $breadcrumbs,
        ));
    }

    #[Route('/save', name: 'app_presupuestos_detalle_save', methods: ['POST'])]
    public function save(Request $request, EntityManagerInterface $entityManager, PresupuestosRepository $presupuestosRepository, ProductosRepository $productosRepository): Response
    {
        $data = json_decode($request->getContent(), true);

        $presupuestoId = $data['presupuesto_id'];
        $productos = $data['productos'];

        $presupuesto = $presupuestosRepository->find($presupuestoId);

        if (!$presupuesto) {
            return $this->json(['success' => false, 'message' => 'Presupuesto no encontrado']);
        }

        foreach ($productos as $item) {
            $producto = $productosRepository->find($item['id']);

            if ($producto) {
                $detalle = new PresupuestosDetalle();
                $detalle->setPresupuesto($presupuesto);
                $detalle->setProducto($producto);
                $detalle->setCantidad($item['cantidad']);
                $detalle->setPrecioUnitario($item['precio']);
                $detalle->setSubtotal($item['cantidad'] * $item['precio']);
                $detalle->setCreatedAt(new \DateTimeImmutable());
                $detalle->setUpdatedAt(new \DateTimeImmutable());

                $entityManager->persist($detalle);
            }
        }

        $entityManager->flush();

        return $this->json(['success' => true]);
    }

    #[Route('/{id}', name: 'app_presupuestos_show', methods: ['GET'], requirements: ['id' => '\d+'])]
    public function show(Presupuestos $presupuesto): Response
    {
        $breadcrumbs = [
            ['label' => 'Presupuestos', 'url' => $this->generateUrl('app_presupuestos_index')],
            ['label' => 'Ver: ' . $presupuesto->getClienteNombre(), 'url' => '']
        ];

        return $this->render('presupuestos/show.html.twig', [
            'presupuesto' => $presupuesto,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_presupuestos_detalle_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, int $id, PresupuestosDetalleRepository $repository, EntityManagerInterface $entityManager): Response
    {
        $detalle = $repository->find($id);

        if (!$detalle) {
            throw $this->createNotFoundException('El detalle no existe');
        }

        if ($request->isMethod('POST')) {
            $cantidad = $request->request->get('cantidad');
            $precioUnitario = $request->request->get('precio_unitario');

            $detalle->setCantidad($cantidad);
            $detalle->setPrecioUnitario($precioUnitario);
            $detalle->setSubtotal((string) (floatval($cantidad) * floatval($precioUnitario)));
            $detalle->setUpdatedAt(new \DateTimeImmutable());

            $entityManager->flush();

            $this->addFlash('success', 'Detalle actualizado correctamente');
            return $this->redirectToRoute('app_presupuestos_detalle_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Detalle Presupuestos', 'url' => $this->generateUrl('app_presupuestos_detalle_index')],
            ['label' => 'Editar Detalle #' . $detalle->getId(), 'url' => '']
        ];

        return $this->render('presupuestos_detalle/edit.html.twig', [
            'presupuestos_detalle' => $detalle,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_presupuestos_detalle_delete', methods: ['POST'])]
    public function delete(Request $request, int $id, PresupuestosDetalleRepository $repository, EntityManagerInterface $entityManager): Response
    {
        $detalle = $repository->find($id);

        if (!$detalle) {
            throw $this->createNotFoundException('El detalle no existe');
        }

        if ($this->isCsrfTokenValid('delete' . $detalle->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($detalle);
            $entityManager->flush();
            $this->addFlash('success', 'Detalle eliminado correctamente');
        }

        return $this->redirectToRoute('app_presupuestos_detalle_index', [], Response::HTTP_SEE_OTHER);
    }
}
