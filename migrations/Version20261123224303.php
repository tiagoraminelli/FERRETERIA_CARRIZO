<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20261123224303 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE producto_proveedor (id INT AUTO_INCREMENT NOT NULL, clear VARCHAR(255) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE productos_historial DROP FOREIGN KEY `FK_HISTORIAL_PRODUCTO`');
        $this->addSql('DROP TABLE productos_historial');
        $this->addSql('ALTER TABLE productos ADD iva NUMERIC(5, 2) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE productos_historial (id INT AUTO_INCREMENT NOT NULL, producto_id INT NOT NULL, nombre VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, descripcion LONGTEXT CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, precio NUMERIC(10, 2) DEFAULT NULL, precio_costo NUMERIC(10, 2) DEFAULT NULL, stock NUMERIC(10, 3) DEFAULT NULL, imagen VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, activo TINYINT DEFAULT NULL, codigo_barra VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`, categoria_id INT DEFAULT NULL, created_at DATETIME DEFAULT NULL, INDEX IDX_HISTORIAL_PRODUCTO (producto_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE productos_historial ADD CONSTRAINT `FK_HISTORIAL_PRODUCTO` FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE');
        $this->addSql('DROP TABLE producto_proveedor');
        $this->addSql('ALTER TABLE productos DROP iva');
    }
}
