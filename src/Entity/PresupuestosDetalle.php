<?php

namespace App\Entity;

use App\Repository\PresupuestosDetalleRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PresupuestosDetalleRepository::class)]
#[ORM\Table(name: 'presupuestos_detalle')]
class PresupuestosDetalle
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'detalles')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Presupuestos $presupuesto = null;

    #[ORM\ManyToOne(inversedBy: 'presupuestosDetalles')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Productos $producto = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 3)]
    private ?string $cantidad = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $precio_unitario = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $subtotal = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $updated_at = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPresupuesto(): ?Presupuestos
    {
        return $this->presupuesto;
    }

    public function setPresupuesto(?Presupuestos $presupuesto): static
    {
        $this->presupuesto = $presupuesto;
        return $this;
    }

    public function getProducto(): ?Productos
    {
        return $this->producto;
    }

    public function setProducto(?Productos $producto): static
    {
        $this->producto = $producto;
        return $this;
    }

    public function getCantidad(): ?string
    {
        return $this->cantidad;
    }

    public function setCantidad(string $cantidad): static
    {
        $this->cantidad = $cantidad;
        return $this;
    }

    public function getPrecioUnitario(): ?string
    {
        return $this->precio_unitario;
    }

    public function setPrecioUnitario(string $precio_unitario): static
    {
        $this->precio_unitario = $precio_unitario;
        return $this;
    }

    public function getSubtotal(): ?string
    {
        return $this->subtotal;
    }

    public function setSubtotal(string $subtotal): static
    {
        $this->subtotal = $subtotal;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): static
    {
        $this->created_at = $created_at;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeImmutable $updated_at): static
    {
        $this->updated_at = $updated_at;
        return $this;
    }
}
