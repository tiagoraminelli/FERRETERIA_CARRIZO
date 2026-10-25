<?php

namespace App\Controller;

use App\Entity\Ventas;
use App\Entity\VentasDetalle;
use App\Entity\Clientes;
use App\Entity\Productos;
use App\Form\VentasType;
use App\Repository\VentasRepository;
use App\Repository\ClientesRepository;
use App\Repository\CategoriaRepository;
use App\Repository\ProductosRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/ventas')]
final class VentasController extends AbstractController
{
    #[Route(name: 'app_ventas_index', methods: ['GET'])]
    public function index(
        Request $request,
        VentasRepository $ventasRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $estado = $request->query->get('estado');
        $formaPago = $request->query->get('forma_pago');

        $queryBuilder = $ventasRepository->createQueryBuilder('v')
            ->leftJoin('v.cliente', 'c')
            ->leftJoin('v.usuario', 'u')
            ->addSelect('c', 'u');

        if ($search) {
            $queryBuilder
                ->andWhere('v.cliente_nombre LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($estado && $estado !== '') {
            $queryBuilder
                ->andWhere('v.estado = :estado')
                ->setParameter('estado', $estado);
        }

        if ($formaPago && $formaPago !== '') {
            $queryBuilder
                ->andWhere('v.forma_pago = :formaPago')
                ->setParameter('formaPago', $formaPago);
        }

        $queryBuilder->orderBy('v.id', 'DESC');

        $ventas = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $breadcrumbs = [
            ['label' => 'Ventas', 'url' => '']
        ];

        return $this->render('ventas/index.html.twig', [
            'ventas' => $ventas,
            'search' => $search,
            'estado' => $estado,
            'formaPago' => $formaPago,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_ventas_new', methods: ['GET', 'POST'])]
    public function new(
        Request $request,
        EntityManagerInterface $entityManager,
        ClientesRepository $clientesRepository,
        CategoriaRepository $categoriaRepository
    ): Response {
        $venta = new Ventas();
        $venta->setFecha(new \DateTimeImmutable());
        $venta->setCreatedAt(new \DateTimeImmutable());
        $venta->setUpdatedAt(new \DateTimeImmutable());
        $venta->setEstado('pendiente');
        $venta->setFormaPago('efectivo');
        $venta->setSubtotal('0');
        $venta->setDescuento('0');
        $venta->setTotal('0');
        $venta->setCrearCliente(true);

        $user = $this->getUser();
        if ($user) {
            $venta->setUsuario($user);
        }

        $form = $this->createForm(VentasType::class, $venta);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $productosData = $request->request->all('productos');

            if ($productosData) {
                foreach ($productosData as $item) {
                    $productoId = $item['id'] ?? null;
                    $cantidad = $item['cantidad'] ?? 1;
                    $precioUnitario = $item['precio'] ?? 0;

                    if ($productoId) {
                        $producto = $entityManager->getRepository(Productos::class)->find($productoId);
                        if ($producto) {
                            $detalle = new VentasDetalle();
                            $detalle->setVenta($venta);
                            $detalle->setProducto($producto);
                            $detalle->setCantidad($cantidad);
                            $detalle->setPrecioUnitario($precioUnitario);
                            $subtotal = floatval($cantidad) * floatval($precioUnitario);
                            $detalle->setSubtotal((string) $subtotal);
                            $detalle->setCreatedAt(new \DateTimeImmutable());
                            $detalle->setUpdatedAt(new \DateTimeImmutable());

                            $entityManager->persist($detalle);
                        }
                    }
                }
            }

            // Calcular total de la venta
            $subtotal = 0;
            foreach ($venta->getDetalles() as $detalle) {
                $subtotal += floatval($detalle->getSubtotal());
            }

            $descuento = floatval($venta->getDescuento());
            $total = $subtotal - $descuento;

            $venta->setSubtotal((string) $subtotal);
            $venta->setTotal((string) $total);

            // Crear cliente automáticamente si está marcado
            if ($venta->isCrearCliente()) {
                $clienteExistente = null;
                if ($venta->getClienteDni()) {
                    $clienteExistente = $clientesRepository->findOneBy(['dni_cuit' => $venta->getClienteDni()]);
                }

                if (!$clienteExistente) {
                    $cliente = new Clientes();
                    $cliente->setNombre($venta->getClienteNombre());
                    $cliente->setTelefono($venta->getClienteTelefono());
                    $cliente->setDniCuit($venta->getClienteDni());
                    $cliente->setEmail($venta->getClienteEmail());
                    $cliente->setDireccion($venta->getClienteDireccion());
                    $cliente->setLocalidad($venta->getClienteLocalidad());
                    $cliente->setProvincia($venta->getClienteProvincia());
                    $cliente->setCondicionIva('Consumidor Final');
                    $cliente->setActivo(true);
                    $cliente->setCreatedAt(new \DateTimeImmutable());
                    $cliente->setUpdatedAt(new \DateTimeImmutable());

                    $entityManager->persist($cliente);
                    $venta->setCliente($cliente);
                } else {
                    $venta->setCliente($clienteExistente);
                }
            }


            $entityManager->persist($venta);
            $entityManager->flush();

            $this->addFlash('success', 'Venta creada correctamente');
            return $this->redirectToRoute('app_ventas_show', ['id' => $venta->getId()], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Ventas', 'url' => $this->generateUrl('app_ventas_index')],
            ['label' => 'Crear Venta', 'url' => '']
        ];

        $clientes = $clientesRepository->findBy(['activo' => true], ['nombre' => 'ASC']);
        $categorias = $categoriaRepository->findAll();

        return $this->render('ventas/new.html.twig', [
            'venta' => $venta,
            'form' => $form,
            'clientes' => $clientes,
            'categorias' => $categorias,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }


    #[Route('/{id}', name: 'app_ventas_show', methods: ['GET'])]
    public function show(int $id, VentasRepository $repository): Response
    {
        $venta = $repository->find($id);

        if (!$venta) {
            throw $this->createNotFoundException('La venta no existe');
        }

        $breadcrumbs = [
            ['label' => 'Ventas', 'url' => $this->generateUrl('app_ventas_index')],
            ['label' => 'Ver Venta #' . $venta->getId(), 'url' => '']
        ];

        return $this->render('ventas/show.html.twig', [
            'venta' => $venta,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_ventas_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Ventas $venta, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(VentasType::class, $venta);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Recalcular total
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

            $this->addFlash('success', 'Venta actualizada correctamente');

            return $this->redirectToRoute('app_ventas_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Ventas', 'url' => $this->generateUrl('app_ventas_index')],
            ['label' => 'Editar Venta #' . $venta->getId(), 'url' => '']
        ];

        return $this->render('ventas/edit.html.twig', [
            'venta' => $venta,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_ventas_delete', methods: ['POST'])]
    public function delete(Request $request, Ventas $venta, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $venta->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($venta);
            $entityManager->flush();
            $this->addFlash('success', 'Venta eliminada correctamente');
        }

        return $this->redirectToRoute('app_ventas_index', [], Response::HTTP_SEE_OTHER);
    }
}
