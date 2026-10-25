<?php

namespace App\Entity;

use App\Repository\VentasRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: VentasRepository::class)]
#[ORM\Table(name: 'ventas')]
class Ventas
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'SET NULL')]
    private ?Clientes $cliente = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'SET NULL')]
    private ?Users $usuario = null;

    #[ORM\Column(length: 150)]
    private ?string $cliente_nombre = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $cliente_telefono = null;

    #[ORM\Column(length: 30, nullable: true)]
    private ?string $cliente_dni = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $cliente_email = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $cliente_direccion = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $cliente_localidad = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $cliente_provincia = null;

    #[ORM\Column]
    private ?bool $crear_cliente = false;

    #[ORM\Column]
    private ?\DateTimeImmutable $fecha = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $subtotal = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2, nullable: true)]
    private ?string $descuento = '0';

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $total = null;

    #[ORM\Column(length: 20)]
    private ?string $forma_pago = 'efectivo';

    #[ORM\Column(length: 20)]
    private ?string $estado = 'pendiente';

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $notas = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $updated_at = null;

    /**
     * @var Collection<int, VentasDetalle>
     */
    #[ORM\OneToMany(targetEntity: VentasDetalle::class, mappedBy: 'venta', cascade: ['persist', 'remove'])]
    private Collection $detalles;

    public function __construct()
    {
        $this->detalles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCliente(): ?Clientes
    {
        return $this->cliente;
    }

    public function setCliente(?Clientes $cliente): static
    {
        $this->cliente = $cliente;
        return $this;
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

    public function getClienteDni(): ?string
    {
        return $this->cliente_dni;
    }

    public function setClienteDni(?string $cliente_dni): static
    {
        $this->cliente_dni = $cliente_dni;
        return $this;
    }

    public function getClienteEmail(): ?string
    {
        return $this->cliente_email;
    }

    public function setClienteEmail(?string $cliente_email): static
    {
        $this->cliente_email = $cliente_email;
        return $this;
    }

    public function getClienteDireccion(): ?string
    {
        return $this->cliente_direccion;
    }

    public function setClienteDireccion(?string $cliente_direccion): static
    {
        $this->cliente_direccion = $cliente_direccion;
        return $this;
    }

    public function getClienteLocalidad(): ?string
    {
        return $this->cliente_localidad;
    }

    public function setClienteLocalidad(?string $cliente_localidad): static
    {
        $this->cliente_localidad = $cliente_localidad;
        return $this;
    }

    public function getClienteProvincia(): ?string
    {
        return $this->cliente_provincia;
    }

    public function setClienteProvincia(?string $cliente_provincia): static
    {
        $this->cliente_provincia = $cliente_provincia;
        return $this;
    }

    public function isCrearCliente(): ?bool
    {
        return $this->crear_cliente;
    }

    public function setCrearCliente(bool $crear_cliente): static
    {
        $this->crear_cliente = $crear_cliente;
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

    public function getFormaPago(): ?string
    {
        return $this->forma_pago;
    }

    public function setFormaPago(string $forma_pago): static
    {
        $this->forma_pago = $forma_pago;
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
     * @return Collection<int, VentasDetalle>
     */
    public function getDetalles(): Collection
    {
        return $this->detalles;
    }

    public function addDetalle(VentasDetalle $detalle): static
    {
        if (!$this->detalles->contains($detalle)) {
            $this->detalles->add($detalle);
            $detalle->setVenta($this);
        }

        return $this;
    }

    public function removeDetalle(VentasDetalle $detalle): static
    {
        if ($this->detalles->removeElement($detalle)) {
            if ($detalle->getVenta() === $this) {
                $detalle->setVenta(null);
            }
        }

        return $this;
    }
}
