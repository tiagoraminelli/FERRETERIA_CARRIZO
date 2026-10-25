<?php

namespace App\Controller;

use App\Entity\Clientes;
use App\Form\ClientesType;
use App\Repository\ClientesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/clientes')]
final class ClientesController extends AbstractController
{
    #[Route(name: 'app_clientes_index', methods: ['GET'])]
    public function index(
        Request $request,
        ClientesRepository $clientesRepository,
        PaginatorInterface $paginator
    ): Response {
        $search = $request->query->get('search');
        $activo = $request->query->get('activo');

        // Obtener condiciones como array
        $condiciones = $request->query->all('condiciones');
        if (!is_array($condiciones)) {
            $condiciones = [];
        }

        $queryBuilder = $clientesRepository->createQueryBuilder('c');

        // Búsqueda por nombre, DNI/CUIT, teléfono o email
        if ($search) {
            $searchNormalized = str_replace(['-', ' ', '.'], '', $search);
            $queryBuilder
                ->where('c.nombre LIKE :search')
                ->orWhere('c.dni_cuit LIKE :search')
                ->orWhere('c.dni_cuit LIKE :searchNormalized')
                ->orWhere('c.telefono LIKE :search')
                ->orWhere('c.email LIKE :search')
                ->setParameter('search', '%' . $search . '%')
                ->setParameter('searchNormalized', '%' . $searchNormalized . '%');
        }

        // Filtro por estado
        if ($activo !== null && $activo !== '') {
            $queryBuilder
                ->andWhere('c.activo = :activo')
                ->setParameter('activo', $activo);
        }

        // Filtro por condiciones IVA (checkboxes)
        if (!empty($condiciones)) {
            $queryBuilder
                ->andWhere('c.condicion_iva IN (:condiciones)')
                ->setParameter('condiciones', $condiciones);
        }

        $queryBuilder->orderBy('c.id', 'DESC');

        $clientes = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            10
        );

        $condicionesIva = [
            'Consumidor Final',
            'Responsable Inscripto',
            'Monotributista',
            'Exento'
        ];

        $breadcrumbs = [
            ['label' => 'Clientes', 'url' => '']
        ];

        return $this->render('clientes/index.html.twig', [
            'clientes' => $clientes,
            'search' => $search,
            'activo' => $activo,
            'condiciones' => $condiciones,
            'condicionesIva' => $condicionesIva,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/new', name: 'app_clientes_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $cliente = new Clientes();
        $cliente->setActivo(true);
        $cliente->setCreatedAt(new \DateTimeImmutable());
        $cliente->setUpdatedAt(new \DateTimeImmutable());

        $form = $this->createForm(ClientesType::class, $cliente);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($cliente);
            $entityManager->flush();

            $this->addFlash('success', 'Cliente creado correctamente');

            return $this->redirectToRoute('app_clientes_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Clientes', 'url' => $this->generateUrl('app_clientes_index')],
            ['label' => 'Crear Cliente', 'url' => '']
        ];

        return $this->render('clientes/new.html.twig', [
            'cliente' => $cliente,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_clientes_show', methods: ['GET'])]
    public function show(Clientes $cliente): Response
    {
        $breadcrumbs = [
            ['label' => 'Clientes', 'url' => $this->generateUrl('app_clientes_index')],
            ['label' => 'Ver: ' . $cliente->getNombre(), 'url' => '']
        ];

        return $this->render('clientes/show.html.twig', [
            'cliente' => $cliente,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_clientes_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Clientes $cliente, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ClientesType::class, $cliente);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $cliente->setUpdatedAt(new \DateTimeImmutable());
            $entityManager->flush();

            $this->addFlash('success', 'Cliente actualizado correctamente');

            return $this->redirectToRoute('app_clientes_index', [], Response::HTTP_SEE_OTHER);
        }

        $breadcrumbs = [
            ['label' => 'Clientes', 'url' => $this->generateUrl('app_clientes_index')],
            ['label' => 'Editar: ' . $cliente->getNombre(), 'url' => '']
        ];

        return $this->render('clientes/edit.html.twig', [
            'cliente' => $cliente,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);
    }

    #[Route('/{id}', name: 'app_clientes_delete', methods: ['POST'])]
    public function delete(Request $request, Clientes $cliente, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $cliente->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($cliente);
            $entityManager->flush();
            $this->addFlash('success', 'Cliente eliminado correctamente');
        }

        return $this->redirectToRoute('app_clientes_index', [], Response::HTTP_SEE_OTHER);
    }
}
