<?php

namespace App\Controller;

use App\Entity\Users;
use App\Form\UsersType;
use App\Repository\UsersRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

# composer require knplabs/knp-paginator-bundle
# Dependencia para crear las paginaciones en la vista de index, se puede usar para paginar cualquier consulta a la base de datos, no solo para usuarios
use Knp\Component\Pager\PaginatorInterface;

# para delimitar el número de paginas que se muestran en la vista ir a:
# config/packages/knp_paginator.yaml
// knp_paginator:
//     page_range: 3
//     template:
//         pagination: '@KnpPaginator/Pagination/bootstrap_v5_pagination.html.twig'

// php bin/console debug:router para ver las rutas creadas en este controlador, se pueden usar los nombres de las rutas para generar URLs en las vistas o redirecciones

#[Route('/users')]
final class UsersController extends AbstractController
{
    /**
     * Muestra la lista de todos los usuarios
     * @Route("/", name="app_users_index", methods={"GET"})
     * Equivalente a: UserController@index en Laravel
     */
    #[Route(name: 'app_users_index', methods: ['GET'])]
    public function index(
        Request $request,
        UsersRepository $usersRepository,
        PaginatorInterface $paginator
    ): Response {

        $search = $request->query->get('search');
        $verified = $request->query->get('verified');

        $query = $usersRepository
            ->createQueryBuilder('u');

        if ($search) {

            $query
                ->where('u.name LIKE :search')
                ->orWhere('u.email LIKE :search')
                ->setParameter('search', '%' . $search . '%');
        }

        if ($verified !== null && $verified !== '') {
            if ($verified == '1') {
                $query->andWhere('u.email_verified_at IS NOT NULL');
            } elseif ($verified == '0') {
                $query->andWhere('u.email_verified_at IS NULL');
            }
        }

        $query->orderBy('u.id', 'DESC');

        $users = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1),
            5
        );

        $breadcrumbs = [
            ['label' => 'Usuarios', 'url' => '']
        ];

        # renderiza la vista de index y le pasa la variable de usuarios, el valor de búsqueda y el estado de verificación para mantenerlos en el formulario

        return $this->render('users/index.html.twig', [
            'users' => $users,
            'search' => $search,
            'verified' => $verified,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    /**
     * Muestra el formulario para crear un nuevo usuario y lo guarda en la BD
     * @Route("/new", name="app_users_new", methods={"GET", "POST"})
     * Equivalente a: UserController@create y UserController@store en Laravel
     */
    #[Route('/new', name: 'app_users_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = new Users();
        $form = $this->createForm(UsersType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($user);
            $entityManager->flush();

            return $this->redirectToRoute('app_users_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Usuarios', 'url' => $this->generateUrl('app_users_index')],
            ['label' => 'Crear Usuario', 'url' => '']
        ];

        return $this->render('users/new.html.twig', [
            'user' => $user,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    /**
     * Muestra los detalles de un usuario específico
     * @Route("/{id}", name="app_users_show", methods={"GET"})
     * Equivalente a: UserController@show en Laravel
     */
    #[Route('/{id}', name: 'app_users_show', methods: ['GET'])]
    public function show(Users $user): Response
    {
        $breadcrumbs = [
            ['label' => 'Usuarios', 'url' => $this->generateUrl('app_users_index')],
            ['label' => 'Ver: ' . $user->getName() ?? $user->getEmail(), 'url' => '']
        ];

        return $this->render('users/show.html.twig', [
            'user' => $user,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    /**
     * Muestra el formulario para editar un usuario y actualiza sus datos
     * @Route("/{id}/edit", name="app_users_edit", methods={"GET", "POST"})
     * Equivalente a: UserController@edit y UserController@update en Laravel
     */
    #[Route('/{id}/edit', name: 'app_users_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Users $user, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(UsersType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_users_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Usuarios', 'url' => $this->generateUrl('app_users_index')],
            ['label' => 'Editar: ' . ($user->getName() ?? $user->getEmail()), 'url' => '']
        ];

        return $this->render('users/edit.html.twig', [
            'user' => $user,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    /**
     * Elimina un usuario de la base de datos
     * @Route("/{id}", name="app_users_delete", methods={"POST"})
     * Equivalente a: UserController@destroy en Laravel
     */
    #[Route('/{id}', name: 'app_users_delete', methods: ['POST'])]
    public function delete(Request $request, Users $user, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $user->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($user);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_users_index', [], Response::HTTP_SEE_OTHER);
    }
}
