<?php

namespace App\Controller;

use App\Entity\VentasDetalle;
use App\Form\VentasDetalleType;
use App\Repository\VentasDetalleRepository;
use App\Repository\VentasRepository;
use App\Repository\ProductosRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/ventas/detalle')]
final class VentasDetalleController extends AbstractController
{
    #[Route(name: 'app_ventas_detalle_index', methods: ['GET'])]
    public function index(
        Request $request,
        VentasDetalleRepository $repository,
        PaginatorInterface $paginator
    ): Response {
        $queryBuilder = $repository->createQueryBuilder('d')
            ->leftJoin('d.venta', 'v')
            ->leftJoin('d.producto', 'p')
            ->addSelect('v', 'p')
            ->orderBy('d.id', 'DESC');

        $detalles = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $breadcrumbs = [
            ['label' => 'Detalle Ventas', 'url' => '']
        ];

        return $this->render('ventas_detalle/index.html.twig', [
            'ventas_detalles' => $detalles,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_ventas_detalle_new', methods: ['GET', 'POST'])]
    public function new(
        Request $request,
        EntityManagerInterface $entityManager,
        VentasRepository $ventasRepository,
        ProductosRepository $productosRepository
    ): Response {
        $detalle = new VentasDetalle();
        $detalle->setCreatedAt(new \DateTimeImmutable());
        $detalle->setUpdatedAt(new \DateTimeImmutable());

        $form = $this->createForm(VentasDetalleType::class, $detalle);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Calcular subtotal
            $cantidad = floatval($detalle->getCantidad());
            $precioUnitario = floatval($detalle->getPrecioUnitario());
            $subtotal = $cantidad * $precioUnitario;
            $detalle->setSubtotal((string) $subtotal);

            $entityManager->persist($detalle);
            $entityManager->flush();

            // Actualizar total de la venta
            $this->actualizarTotalesVenta($detalle->getVenta(), $entityManager);

            $this->addFlash('success', 'Detalle creado correctamente');

            return $this->redirectToRoute('app_ventas_detalle_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Detalle Ventas', 'url' => $this->generateUrl('app_ventas_detalle_index')],
            ['label' => 'Crear Detalle', 'url' => '']
        ];

        $ventas = $ventasRepository->findBy([], ['id' => 'DESC']);
        $productos = $productosRepository->findBy(['activo' => true], ['nombre' => 'ASC']);

        return $this->render('ventas_detalle/new.html.twig', [
            'ventas_detalle' => $detalle,
            'form' => $form,
            'ventas' => $ventas,
            'productos' => $productos,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_ventas_detalle_show', methods: ['GET'])]
    public function show(VentasDetalle $ventasDetalle): Response
    {
        $breadcrumbs = [
            ['label' => 'Detalle Ventas', 'url' => $this->generateUrl('app_ventas_detalle_index')],
            ['label' => 'Ver Detalle #' . $ventasDetalle->getId(), 'url' => '']
        ];

        return $this->render('ventas_detalle/show.html.twig', [
            'ventas_detalle' => $ventasDetalle,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_ventas_detalle_edit', methods: ['GET', 'POST'])]
    public function edit(
        Request $request,
        VentasDetalle $ventasDetalle,
        EntityManagerInterface $entityManager
    ): Response {
        $form = $this->createForm(VentasDetalleType::class, $ventasDetalle);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Recalcular subtotal
            $cantidad = floatval($ventasDetalle->getCantidad());
            $precioUnitario = floatval($ventasDetalle->getPrecioUnitario());
            $subtotal = $cantidad * $precioUnitario;
            $ventasDetalle->setSubtotal((string) $subtotal);
            $ventasDetalle->setUpdatedAt(new \DateTimeImmutable());

            $entityManager->flush();

            // Actualizar total de la venta
            $this->actualizarTotalesVenta($ventasDetalle->getVenta(), $entityManager);

            $this->addFlash('success', 'Detalle actualizado correctamente');

            return $this->redirectToRoute('app_ventas_detalle_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Detalle Ventas', 'url' => $this->generateUrl('app_ventas_detalle_index')],
            ['label' => 'Editar Detalle #' . $ventasDetalle->getId(), 'url' => '']
        ];

        return $this->render('ventas_detalle/edit.html.twig', [
            'ventas_detalle' => $ventasDetalle,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_ventas_detalle_delete', methods: ['POST'])]
    public function delete(
        Request $request,
        VentasDetalle $ventasDetalle,
        EntityManagerInterface $entityManager
    ): Response {
        $venta = $ventasDetalle->getVenta();

        if ($this->isCsrfTokenValid('delete' . $ventasDetalle->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($ventasDetalle);
            $entityManager->flush();

            // Actualizar total de la venta
            if ($venta) {
                $this->actualizarTotalesVenta($venta, $entityManager);
            }

            $this->addFlash('success', 'Detalle eliminado correctamente');
        }

        return $this->redirectToRoute('app_ventas_detalle_index', [], Response::HTTP_SEE_OTHER);
    }

    // ==================== METODO PRIVADO ====================

    private function actualizarTotalesVenta(Ventas $venta, EntityManagerInterface $entityManager): void
    {
        $subtotal = 0;
        foreach ($venta->getDetalles() as $detalle) {
            $subtotal += floatval($detalle->getSubtotal());
        }

        $descuento = floatval($venta->getDescuento());
        $total = $subtotal - $descuento;

        $venta->setSubtotal((string) $subtotal);
        $venta->setTotal((string) $total);
        $venta->setUpdatedAt(new \DateTimeImmutable());

        $entityManager->flush();
    }
}
