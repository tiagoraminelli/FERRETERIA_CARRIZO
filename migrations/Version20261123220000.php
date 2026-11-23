<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20261123220000 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Crea la tabla productos_historial para guardar los cambios de los productos';
    }

    public function up(Schema $schema): void
    {
        // Creamos la tabla con las columnas que usa tu controlador
        $this->addSql('CREATE TABLE productos_historial (
            id INT AUTO_INCREMENT NOT NULL,
            producto_id INT NOT NULL,
            nombre VARCHAR(255) DEFAULT NULL,
            descripcion LONGTEXT DEFAULT NULL,
            precio NUMERIC(10, 2) DEFAULT NULL,
            precio_costo NUMERIC(10, 2) DEFAULT NULL,
            stock NUMERIC(10, 3) DEFAULT NULL,
            imagen VARCHAR(255) DEFAULT NULL,
            activo TINYINT(1) DEFAULT NULL,
            codigo_barra VARCHAR(255) DEFAULT NULL,
            categoria_id INT DEFAULT NULL,
            created_at DATETIME DEFAULT NULL,
            INDEX IDX_HISTORIAL_PRODUCTO (producto_id),
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');

        // Agregamos la llave foránea para que al borrar un producto, se borre su historial
        $this->addSql('ALTER TABLE productos_historial
            ADD CONSTRAINT FK_HISTORIAL_PRODUCTO
            FOREIGN KEY (producto_id)
            REFERENCES productos (id)
            ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // Por si alguna vez querés revertir la migración
        $this->addSql('ALTER TABLE productos_historial DROP FOREIGN KEY FK_HISTORIAL_PRODUCTO');
        $this->addSql('DROP TABLE productos_historial');
    }
}
