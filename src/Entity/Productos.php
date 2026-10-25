<?php

namespace App\Entity;

use App\Repository\ProductosRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProductosRepository::class)]
class Productos
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $nombre = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $descripcion = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 0)]
    private ?string $precio = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 0, nullable: true)]
    private ?string $precio_costo = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 3)]
    private ?string $stock = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $imagen = null;

    #[ORM\Column(nullable: true)]
    private ?bool $activo = null;

    #[ORM\ManyToOne(inversedBy: 'productos')]
    private ?Categoria $categoria = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $codigo_barra = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $updated_at = null;

    /**
     * @var Collection<int, PresupuestosDetalle>
     */
    #[ORM\OneToMany(targetEntity: PresupuestosDetalle::class, mappedBy: 'producto')]
    private Collection $presupuestosDetalles;

    public function __construct()
    {
        $this->presupuestosDetalles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(?string $nombre): static
    {
        $this->nombre = $nombre;
        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(?string $descripcion): static
    {
        $this->descripcion = $descripcion;
        return $this;
    }

    public function getPrecio(): ?string
    {
        return $this->precio;
    }

    public function setPrecio(string $precio): static
    {
        $this->precio = $precio;
        return $this;
    }

    public function getPrecioCosto(): ?string
    {
        return $this->precio_costo;
    }

    public function setPrecioCosto(?string $precio_costo): static
    {
        $this->precio_costo = $precio_costo;
        return $this;
    }

    public function getStock(): ?string
    {
        return $this->stock;
    }

    public function setStock(string $stock): static
    {
        $this->stock = $stock;
        return $this;
    }

    public function getImagen(): ?string
    {
        return $this->imagen;
    }

    public function setImagen(?string $imagen): static
    {
        $this->imagen = $imagen;
        return $this;
    }

    public function isActivo(): ?bool
    {
        return $this->activo;
    }

    public function setActivo(?bool $activo): static
    {
        $this->activo = $activo;
        return $this;
    }

    public function getCategoria(): ?Categoria
    {
        return $this->categoria;
    }

    public function setCategoria(?Categoria $categoria): static
    {
        $this->categoria = $categoria;
        return $this;
    }

    public function getCodigoBarra(): ?string
    {
        return $this->codigo_barra;
    }

    public function setCodigoBarra(?string $codigo_barra): static
    {
        $this->codigo_barra = $codigo_barra;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(?\DateTimeImmutable $created_at): static
    {
        $this->created_at = $created_at;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updated_at): static
    {
        $this->updated_at = $updated_at;
        return $this;
    }

    /**
     * @return Collection<int, PresupuestosDetalle>
     */
    public function getPresupuestosDetalles(): Collection
    {
        return $this->presupuestosDetalles;
    }

    public function addPresupuestosDetalle(PresupuestosDetalle $presupuestosDetalle): static
    {
        if (!$this->presupuestosDetalles->contains($presupuestosDetalle)) {
            $this->presupuestosDetalles->add($presupuestosDetalle);
            $presupuestosDetalle->setProducto($this);
        }

        return $this;
    }

    public function removePresupuestosDetalle(PresupuestosDetalle $presupuestosDetalle): static
    {
        if ($this->presupuestosDetalles->removeElement($presupuestosDetalle)) {
            if ($presupuestosDetalle->getProducto() === $this) {
                $presupuestosDetalle->setProducto(null);
            }
        }

        return $this;
    }
}
