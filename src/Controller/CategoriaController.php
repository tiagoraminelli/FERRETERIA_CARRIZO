<?php

namespace App\Controller;

use App\Entity\Categoria;
use App\Form\CategoriaType;
use App\Repository\CategoriaRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Knp\Component\Pager\PaginatorInterface;

#[Route('/categoria')]
final class CategoriaController extends AbstractController
{
    #[Route(name: 'app_categoria_index', methods: ['GET'])]
    public function index(
        Request $request,
        CategoriaRepository $categoriaRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $activo = $request->query->get('activo');

        $queryBuilder = $categoriaRepository->createQueryBuilder('c');

        if ($search) {
            $queryBuilder
                ->where('c.nombre LIKE :search')
                ->orWhere('c.descripcion LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($activo !== null && $activo !== '') {
            $queryBuilder
                ->andWhere('c.activo = :activo')
                ->setParameter('activo', $activo);
        }

        $queryBuilder->orderBy('c.id', 'DESC');

        $categorias = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            5
        );

        $breadcrumbs = [
            ['label' => 'Categorías', 'url' => '']
        ];

        return $this->render('categoria/index.html.twig', [
            'categorias' => $categorias,
            'search' => $search,
            'activo' => $activo,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_categoria_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $categorium = new Categoria();
        # Las fechas de creación y actualización se establecen automáticamente al crear una nueva categoría
        $categorium->setCreatedAt(new \DateTimeImmutable());
        $categorium->setUpdatedAt(new \DateTimeImmutable());

        #Por defecto la categoría se crea como activa
        $categorium->setActivo(true);
        $form = $this->createForm(CategoriaType::class, $categorium);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($categorium);
            $entityManager->flush();

            $this->addFlash('success', 'Categoría creada correctamente');

            return $this->redirectToRoute('app_categoria_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Categorías', 'url' => $this->generateUrl('app_categoria_index')],
            ['label' => 'Crear Categoría', 'url' => '']
        ];

        return $this->render('categoria/new.html.twig', [
            'categorium' => $categorium,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_categoria_show', methods: ['GET'])]
    public function show(Categoria $categorium): Response
    {
        $breadcrumbs = [
            ['label' => 'Categorías', 'url' => $this->generateUrl('app_categoria_index')],
            ['label' => 'Ver: ' . $categorium->getNombre(), 'url' => '']
        ];

        return $this->render('categoria/show.html.twig', [
            'categorium' => $categorium,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_categoria_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Categoria $categorium, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CategoriaType::class, $categorium);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            $this->addFlash('success', 'Categoría actualizada correctamente');

            return $this->redirectToRoute('app_categoria_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Categorías', 'url' => $this->generateUrl('app_categoria_index')],
            ['label' => 'Editar: ' . $categorium->getNombre(), 'url' => '']
        ];

        return $this->render('categoria/edit.html.twig', [
            'categorium' => $categorium,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_categoria_delete', methods: ['POST'])]
    public function delete(Request $request, Categoria $categorium, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $categorium->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($categorium);
            $entityManager->flush();

            $this->addFlash('success', 'Categoría eliminada correctamente');
        }

        return $this->redirectToRoute('app_categoria_index', [], Response::HTTP_SEE_OTHER);
    }
}
