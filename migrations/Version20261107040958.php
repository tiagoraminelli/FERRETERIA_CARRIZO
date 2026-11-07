<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20261107040958 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE productos_historial DROP FOREIGN KEY `FK_HISTORIAL_PRODUCTO`');
        $this->addSql('DROP TABLE productos_historial');
        $this->addSql('ALTER TABLE clientes CHANGE dni_cuit dni_cuit VARCHAR(30) DEFAULT NULL, CHANGE telefono telefono VARCHAR(50) DEFAULT NULL, CHANGE email email VARCHAR(100) DEFAULT NULL, CHANGE localidad localidad VARCHAR(100) DEFAULT NULL, CHANGE provincia provincia VARCHAR(100) DEFAULT NULL, CHANGE codigo_postal codigo_postal VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE presupuestos CHANGE cliente_telefono cliente_telefono VARCHAR(50) DEFAULT NULL, CHANGE descuento descuento NUMERIC(10, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE productos CHANGE nombre nombre VARCHAR(255) DEFAULT NULL, CHANGE precio precio NUMERIC(10, 2) NOT NULL, CHANGE precio_costo precio_costo NUMERIC(10, 2) DEFAULT NULL, CHANGE imagen imagen VARCHAR(255) DEFAULT NULL, CHANGE codigo_barra codigo_barra VARCHAR(255) DEFAULT NULL, CHANGE created_at created_at DATETIME DEFAULT NULL, CHANGE updated_at updated_at DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE proveedores CHANGE razon_social razon_social VARCHAR(200) DEFAULT NULL, CHANGE cuit cuit VARCHAR(20) DEFAULT NULL, CHANGE telefono telefono VARCHAR(50) DEFAULT NULL, CHANGE email email VARCHAR(100) DEFAULT NULL, CHANGE ciudad ciudad VARCHAR(100) DEFAULT NULL, CHANGE provincia provincia VARCHAR(100) DEFAULT NULL, CHANGE codigo_postal codigo_postal VARCHAR(20) DEFAULT NULL, CHANGE contacto contacto VARCHAR(100) DEFAULT NULL, CHANGE created_at created_at DATETIME DEFAULT NULL, CHANGE updated_at updated_at DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE users CHANGE name name VARCHAR(255) DEFAULT NULL, CHANGE email_verified_at email_verified_at DATETIME DEFAULT NULL, CHANGE remember_token remember_token VARCHAR(100) DEFAULT NULL, CHANGE created_at created_at DATETIME DEFAULT NULL, CHANGE updated_at updated_at DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE ventas CHANGE cliente_telefono cliente_telefono VARCHAR(50) DEFAULT NULL, CHANGE cliente_dni cliente_dni VARCHAR(30) DEFAULT NULL, CHANGE cliente_email cliente_email VARCHAR(100) DEFAULT NULL, CHANGE cliente_localidad cliente_localidad VARCHAR(100) DEFAULT NULL, CHANGE cliente_provincia cliente_provincia VARCHAR(100) DEFAULT NULL, CHANGE descuento descuento NUMERIC(10, 2) DEFAULT NULL');
        $this->addSql('ALTER TABLE messenger_messages CHANGE delivered_at delivered_at DATETIME DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE productos_historial (id INT AUTO_INCREMENT NOT NULL, producto_id INT NOT NULL, nombre VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_general_ci`, descripcion TEXT CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_general_ci`, precio NUMERIC(10, 0) DEFAULT \'NULL\', precio_costo NUMERIC(10, 0) DEFAULT \'NULL\', stock NUMERIC(10, 3) DEFAULT \'NULL\', imagen VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_general_ci`, activo TINYINT DEFAULT NULL, codigo_barra VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_general_ci`, categoria_id INT DEFAULT NULL, created_at DATETIME NOT NULL, INDEX IDX_HISTORIAL_PRODUCTO (producto_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_general_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE productos_historial ADD CONSTRAINT `FK_HISTORIAL_PRODUCTO` FOREIGN KEY (producto_id) REFERENCES productos (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE clientes CHANGE dni_cuit dni_cuit VARCHAR(30) DEFAULT \'NULL\', CHANGE telefono telefono VARCHAR(50) DEFAULT \'NULL\', CHANGE email email VARCHAR(100) DEFAULT \'NULL\', CHANGE localidad localidad VARCHAR(100) DEFAULT \'NULL\', CHANGE provincia provincia VARCHAR(100) DEFAULT \'NULL\', CHANGE codigo_postal codigo_postal VARCHAR(20) DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE messenger_messages CHANGE delivered_at delivered_at DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE presupuestos CHANGE cliente_telefono cliente_telefono VARCHAR(50) DEFAULT \'NULL\', CHANGE descuento descuento NUMERIC(10, 2) DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE productos CHANGE nombre nombre VARCHAR(255) DEFAULT \'NULL\', CHANGE precio precio NUMERIC(10, 0) NOT NULL, CHANGE precio_costo precio_costo NUMERIC(10, 0) DEFAULT \'NULL\', CHANGE imagen imagen VARCHAR(255) DEFAULT \'NULL\', CHANGE codigo_barra codigo_barra VARCHAR(255) DEFAULT \'NULL\', CHANGE created_at created_at DATETIME DEFAULT \'NULL\', CHANGE updated_at updated_at DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE proveedores CHANGE razon_social razon_social VARCHAR(200) DEFAULT \'NULL\', CHANGE cuit cuit VARCHAR(20) DEFAULT \'NULL\', CHANGE telefono telefono VARCHAR(50) DEFAULT \'NULL\', CHANGE email email VARCHAR(100) DEFAULT \'NULL\', CHANGE ciudad ciudad VARCHAR(100) DEFAULT \'NULL\', CHANGE provincia provincia VARCHAR(100) DEFAULT \'NULL\', CHANGE codigo_postal codigo_postal VARCHAR(20) DEFAULT \'NULL\', CHANGE contacto contacto VARCHAR(100) DEFAULT \'NULL\', CHANGE created_at created_at DATETIME DEFAULT \'NULL\', CHANGE updated_at updated_at DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE users CHANGE name name VARCHAR(255) DEFAULT \'NULL\', CHANGE email_verified_at email_verified_at DATETIME DEFAULT \'NULL\', CHANGE remember_token remember_token VARCHAR(100) DEFAULT \'NULL\', CHANGE created_at created_at DATETIME DEFAULT \'NULL\', CHANGE updated_at updated_at DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE ventas CHANGE cliente_telefono cliente_telefono VARCHAR(50) DEFAULT \'NULL\', CHANGE cliente_dni cliente_dni VARCHAR(30) DEFAULT \'NULL\', CHANGE cliente_email cliente_email VARCHAR(100) DEFAULT \'NULL\', CHANGE cliente_localidad cliente_localidad VARCHAR(100) DEFAULT \'NULL\', CHANGE cliente_provincia cliente_provincia VARCHAR(100) DEFAULT \'NULL\', CHANGE descuento descuento NUMERIC(10, 2) DEFAULT \'NULL\'');
    }
}
