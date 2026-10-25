<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\ProductosRepository;
use App\Repository\CategoriaRepository;
use App\Repository\UsersRepository;
use App\Repository\ProveedoresRepository;
use App\Repository\PresupuestosRepository;
use App\Repository\ClientesRepository;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(
        ProductosRepository $productosRepository,
        CategoriaRepository $categoriaRepository,
        UsersRepository $usersRepository,
        ProveedoresRepository $proveedoresRepository,
        PresupuestosRepository $presupuestosRepository,
        ClientesRepository $clientesRepository
    ): Response {
        return $this->render('home/index.html.twig', [
            'totalProductos' => $productosRepository->count([]),
            'totalCategorias' => $categoriaRepository->count([]),
            'totalUsuarios' => $usersRepository->count([]),
            'totalProveedores' => $proveedoresRepository->count([]),
            'totalPresupuestos' => $presupuestosRepository->count([]),
            'totalClientes' => $clientesRepository->count([]),
            'breadcrumbs' => [
                ['label' => 'Inicio', 'url' => '']
            ],
        ]);
    }
}
