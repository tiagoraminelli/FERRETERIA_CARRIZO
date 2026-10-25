<?php

namespace App\Controller;

use App\Entity\Proveedores;
use App\Form\ProveedoresType;
use App\Repository\ProveedoresRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/proveedores')]
final class ProveedoresController extends AbstractController
{
    #[Route(name: 'app_proveedores_index', methods: ['GET'])]
    public function index(
        Request $request,
        ProveedoresRepository $proveedoresRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $activo = $request->query->get('activo');

        $queryBuilder = $proveedoresRepository->createQueryBuilder('p');

        if ($search) {
            $queryBuilder
                ->where('p.nombre LIKE :search')
                ->orWhere('p.razon_social LIKE :search')
                ->orWhere('p.cuit LIKE :search')
                ->orWhere('p.email LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($activo !== null && $activo !== '') {
            $queryBuilder
                ->andWhere('p.activo = :activo')
                ->setParameter('activo', $activo);
        }

        $queryBuilder->orderBy('p.id', 'DESC');

        $proveedores = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $breadcrumbs = [
            ['label' => 'Proveedores', 'url' => '']
        ];

        return $this->render('proveedores/index.html.twig', [
            'proveedores' => $proveedores,
            'search' => $search,
            'activo' => $activo,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_proveedores_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $proveedore = new Proveedores();
        $proveedore->setActivo(true);
        $proveedore->setCreatedAt(new \DateTimeImmutable());
        $proveedore->setUpdatedAt(new \DateTimeImmutable());

        $form = $this->createForm(ProveedoresType::class, $proveedore);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($proveedore);
            $entityManager->flush();

            $this->addFlash('success', 'Proveedor creado correctamente');

            return $this->redirectToRoute('app_proveedores_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Proveedores', 'url' => $this->generateUrl('app_proveedores_index')],
            ['label' => 'Crear Proveedor', 'url' => '']
        ];

        return $this->render('proveedores/new.html.twig', [
            'proveedore' => $proveedore,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_proveedores_show', methods: ['GET'])]
    public function show(Proveedores $proveedore): Response
    {
        $breadcrumbs = [
            ['label' => 'Proveedores', 'url' => $this->generateUrl('app_proveedores_index')],
            ['label' => 'Ver: ' . $proveedore->getNombre(), 'url' => '']
        ];

        return $this->render('proveedores/show.html.twig', [
            'proveedore' => $proveedore,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_proveedores_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Proveedores $proveedore, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProveedoresType::class, $proveedore);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $proveedore->setUpdatedAt(new \DateTimeImmutable());
            $entityManager->flush();

            $this->addFlash('success', 'Proveedor actualizado correctamente');

            return $this->redirectToRoute('app_proveedores_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Proveedores', 'url' => $this->generateUrl('app_proveedores_index')],
            ['label' => 'Editar: ' . $proveedore->getNombre(), 'url' => '']
        ];

        return $this->render('proveedores/edit.html.twig', [
            'proveedore' => $proveedore,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_proveedores_delete', methods: ['POST'])]
    public function delete(Request $request, Proveedores $proveedore, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $proveedore->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($proveedore);
            $entityManager->flush();
            $this->addFlash('success', 'Proveedor eliminado correctamente');
        }

        return $this->redirectToRoute('app_proveedores_index', [], Response::HTTP_SEE_OTHER);
    }
}
