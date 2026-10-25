<?php

namespace App\Entity;

use App\Repository\PresupuestosRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PresupuestosRepository::class)]
#[ORM\Table(name: 'presupuestos')]
class Presupuestos
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'presupuestos')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Users $usuario = null;

    #[ORM\Column(length: 150)]
    private ?string $cliente_nombre = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $cliente_telefono = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $fecha = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $subtotal = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2, nullable: true)]
    private ?string $descuento = '0';

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $total = null;

    #[ORM\Column(length: 20)]
    private ?string $estado = 'borrador';

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $notas = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $updated_at = null;

    /**
     * @var Collection<int, PresupuestosDetalle>
     */
    #[ORM\OneToMany(targetEntity: PresupuestosDetalle::class, mappedBy: 'presupuesto', cascade: ['persist', 'remove'])]
    private Collection $detalles;

    public function __construct()
    {
        $this->detalles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsuario(): ?Users
    {
        return $this->usuario;
    }

    public function setUsuario(?Users $usuario): static
    {
        $this->usuario = $usuario;
        return $this;
    }

    public function getClienteNombre(): ?string
    {
        return $this->cliente_nombre;
    }

    public function setClienteNombre(string $cliente_nombre): static
    {
        $this->cliente_nombre = $cliente_nombre;
        return $this;
    }

    public function getClienteTelefono(): ?string
    {
        return $this->cliente_telefono;
    }

    public function setClienteTelefono(?string $cliente_telefono): static
    {
        $this->cliente_telefono = $cliente_telefono;
        return $this;
    }

    public function getFecha(): ?\DateTimeImmutable
    {
        return $this->fecha;
    }

    public function setFecha(\DateTimeImmutable $fecha): static
    {
        $this->fecha = $fecha;
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

    public function getDescuento(): ?string
    {
        return $this->descuento;
    }

    public function setDescuento(?string $descuento): static
    {
        $this->descuento = $descuento ?: '0';
        return $this;
    }

    public function getTotal(): ?string
    {
        return $this->total;
    }

    public function setTotal(string $total): static
    {
        $this->total = $total;
        return $this;
    }

    public function getEstado(): ?string
    {
        return $this->estado;
    }

    public function setEstado(string $estado): static
    {
        $this->estado = $estado;
        return $this;
    }

    public function getNotas(): ?string
    {
        return $this->notas;
    }

    public function setNotas(?string $notas): static
    {
        $this->notas = $notas;
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

    /**
     * @return Collection<int, PresupuestosDetalle>
     */
    public function getDetalles(): Collection
    {
        return $this->detalles;
    }

    public function addDetalle(PresupuestosDetalle $detalle): static
    {
        if (!$this->detalles->contains($detalle)) {
            $this->detalles->add($detalle);
            $detalle->setPresupuesto($this);
        }

        return $this;
    }

    public function removeDetalle(PresupuestosDetalle $detalle): static
    {
        if ($this->detalles->removeElement($detalle)) {
            if ($detalle->getPresupuesto() === $this) {
                $detalle->setPresupuesto(null);
            }
        }

        return $this;
    }
}
