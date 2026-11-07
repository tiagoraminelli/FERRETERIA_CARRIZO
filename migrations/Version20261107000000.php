<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20261107000000 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Crea la tabla productos_historial y el trigger para guardar versiones anteriores';
    }

    public function up(Schema $schema): void
    {
        // 1. Crear la tabla
        $this->addSql('
            CREATE TABLE productos_historial (
                id INT AUTO_INCREMENT PRIMARY KEY,
                producto_id INT NOT NULL,
                nombre VARCHAR(255),
                descripcion TEXT,
                precio DECIMAL(10,2),
                precio_costo DECIMAL(10,2),
                stock DECIMAL(10,3),
                imagen VARCHAR(255),
                activo TINYINT(1),
                codigo_barra VARCHAR(255),
                categoria_id INT,
                created_at DATETIME NOT NULL,
                INDEX IDX_HISTORIAL_PRODUCTO (producto_id),
                CONSTRAINT FK_HISTORIAL_PRODUCTO FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
            ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB
        ');

        // 2. Crear el trigger (necesita usar un bloque delimitado)
        $this->addSql('
            CREATE TRIGGER trg_productos_before_update
            BEFORE UPDATE ON productos
            FOR EACH ROW
            BEGIN
                IF NOT (OLD.nombre <=> NEW.nombre) OR
                   NOT (OLD.descripcion <=> NEW.descripcion) OR
                   NOT (OLD.precio <=> NEW.precio) OR
                   NOT (OLD.precio_costo <=> NEW.precio_costo) OR
                   NOT (OLD.stock <=> NEW.stock) OR
                   NOT (OLD.imagen <=> NEW.imagen) OR
                   NOT (OLD.activo <=> NEW.activo) OR
                   NOT (OLD.codigo_barra <=> NEW.codigo_barra) OR
                   NOT (OLD.categoria_id <=> NEW.categoria_id)
                THEN
                    INSERT INTO productos_historial (
                        producto_id, nombre, descripcion, precio, precio_costo,
                        stock, imagen, activo, codigo_barra, categoria_id, created_at
                    ) VALUES (
                        OLD.id, OLD.nombre, OLD.descripcion, OLD.precio, OLD.precio_costo,
                        OLD.stock, OLD.imagen, OLD.activo, OLD.codigo_barra, OLD.categoria_id, NOW()
                    );
                END IF;
            END
        ');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TRIGGER IF EXISTS trg_productos_before_update');
        $this->addSql('DROP TABLE productos_historial');
    }
}
