<?php

namespace App\Controller;

use App\Entity\Presupuestos;
use App\Form\PresupuestosType;
use App\Repository\PresupuestosRepository;
use App\Repository\UsersRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\Security;

#[Route('/presupuestos')]
final class PresupuestosController extends AbstractController
{

    #[Route('/{id}/print', name: 'app_presupuestos_print', methods: ['GET'])]
    public function print(Presupuestos $presupuesto): Response
    {
        return $this->render('presupuestos/print.html.twig', [
            'presupuesto' => $presupuesto,
        ]);
    }

    #[Route(name: 'app_presupuestos_index', methods: ['GET'])]
    public function index(
        Request $request,
        PresupuestosRepository $presupuestosRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $estado = $request->query->get('estado');

        $queryBuilder = $presupuestosRepository->createQueryBuilder('p')
            ->leftJoin('p.usuario', 'u')
            ->addSelect('u');

        if ($search) {
            $queryBuilder
                ->andWhere('p.cliente_nombre LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($estado && $estado !== '') {
            $queryBuilder
                ->andWhere('p.estado = :estado')
                ->setParameter('estado', $estado);
        }

        $queryBuilder->orderBy('p.id', 'DESC');

        $presupuestos = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $breadcrumbs = [
            ['label' => 'Presupuestos', 'url' => '']
        ];

        return $this->render('presupuestos/index.html.twig', [
            'presupuestos' => $presupuestos,
            'search' => $search,
            'estado' => $estado,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_presupuestos_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $presupuesto = new Presupuestos();
        $presupuesto->setFecha(new \DateTimeImmutable());
        $presupuesto->setCreatedAt(new \DateTimeImmutable());
        $presupuesto->setUpdatedAt(new \DateTimeImmutable());
        $presupuesto->setEstado('borrador');
        $presupuesto->setSubtotal('0');
        $presupuesto->setDescuento('0');
        $presupuesto->setTotal('0');

        $form = $this->createForm(PresupuestosType::class, $presupuesto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($presupuesto);
            $entityManager->flush();

            $this->addFlash('success', 'Presupuesto creado correctamente');

            return $this->redirectToRoute('app_presupuestos_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Presupuestos', 'url' => $this->generateUrl('app_presupuestos_index')],
            ['label' => 'Crear Presupuesto', 'url' => '']
        ];

        return $this->render('presupuestos/new.html.twig', [
            'presupuesto' => $presupuesto,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_presupuestos_show', methods: ['GET'])]
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

    #[Route('/{id}/edit', name: 'app_presupuestos_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Presupuestos $presupuesto, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(PresupuestosType::class, $presupuesto);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Recalcular total
            $subtotal = floatval($presupuesto->getSubtotal());
            $descuento = floatval($presupuesto->getDescuento());
            $total = $subtotal - $descuento;
            $presupuesto->setTotal((string) $total);
            $presupuesto->setUpdatedAt(new \DateTimeImmutable());

            $entityManager->flush();

            $this->addFlash('success', 'Presupuesto actualizado correctamente');

            return $this->redirectToRoute('app_presupuestos_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Presupuestos', 'url' => $this->generateUrl('app_presupuestos_index')],
            ['label' => 'Editar: ' . $presupuesto->getClienteNombre(), 'url' => '']
        ];

        return $this->render('presupuestos/edit.html.twig', [
            'presupuesto' => $presupuesto,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_presupuestos_delete', methods: ['POST'])]
    public function delete(Request $request, Presupuestos $presupuesto, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $presupuesto->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($presupuesto);
            $entityManager->flush();
            $this->addFlash('success', 'Presupuesto eliminado correctamente');
        }

        return $this->redirectToRoute('app_presupuestos_index', [], Response::HTTP_SEE_OTHER);
    }
}
