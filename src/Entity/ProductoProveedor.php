<?php

namespace App\Entity;

use App\Repository\ProductoProveedorRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProductoProveedorRepository::class)]
class ProductoProveedor
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $clear = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClear(): ?string
    {
        return $this->clear;
    }

    public function setClear(string $clear): static
    {
        $this->clear = $clear;

        return $this;
    }
}
