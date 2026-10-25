
# COMANDOS ÚTILES PARA SYMFONY 7

---

# LIMPIAR CACHÉ

```bash
php bin/console cache:clear
php bin/console cache:clear --env=dev
```

---

# CREAR CONTROLADORES

## Crear un controlador

```bash
php bin/console make:controller HomeController
```

Genera:

* `src/Controller/HomeController.php`
* `templates/home/index.html.twig`

---

# ENTIDADES

## Crear una entidad

```bash
php bin/console make:entity Productos
```

Opciones habituales:

* `new property name`: nombre del campo
* `field type`: string, text, integer, decimal, boolean, datetime, relation
* `nullable`: yes/no

---

## Crear una entidad completa

```bash
php bin/console make:entity Proveedores
```

Ejemplo de campos:

```text
nombre (string, length=150, nullable=false)
razon_social (string, length=200, nullable=true)
cuit (string, length=20, nullable=true)
telefono (string, length=50, nullable=true)
email (string, length=100, nullable=true)
direccion (text, nullable=true)
ciudad (string, length=100, nullable=true)
provincia (string, length=100, nullable=true)
codigo_postal (string, length=20, nullable=true)
contacto (string, length=100, nullable=true)
notas (text, nullable=true)
activo (boolean, nullable=true)
created_at (datetime_immutable, nullable=true)
updated_at (datetime_immutable, nullable=true)
```

---

## Agregar campo a una entidad existente

```bash
php bin/console make:entity Productos
```

Luego agregar el nuevo campo desde el asistente.

Actualizar la base de datos:

```bash
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```

---

# CRUD Y FORMULARIOS

## Crear CRUD completo

```bash
php bin/console make:crud Proveedores
```

Genera:

* Controlador
* Formulario
* Vistas Twig
* Operaciones CRUD completas

Archivos generados:

```text
index
new
show
edit
delete
_form
_delete_form
```

---

## Crear formulario

```bash
php bin/console make:form ProveedoresType
```

---

# MIGRACIONES

## Crear migración

```bash
php bin/console make:migration
```

## Ejecutar migración

```bash
php bin/console doctrine:migrations:migrate
```

## Ver estado de migraciones

```bash
php bin/console doctrine:migrations:status
```

## Revertir última migración

```bash
php bin/console doctrine:migrations:execute --down 1
```

---

# BASE DE DATOS

## Crear base de datos

```bash
php bin/console doctrine:database:create
```

## Validar esquema

```bash
php bin/console doctrine:schema:validate
```

## Actualizar esquema sin migraciones (NO recomendado en producción)

```bash
php bin/console doctrine:schema:update --force
```

## Ver entidades mapeadas

```bash
php bin/console doctrine:mapping:info
```

---

# RUTAS

## Ver todas las rutas

```bash
php bin/console debug:router
```

## Ver una ruta específica

```bash
php bin/console debug:router app_home
```

## Limpiar caché de rutas

```bash
php bin/console router:clear-cache
```

---

# FIXTURES (DATOS DE PRUEBA)

## Crear fixtures

```bash
php bin/console make:fixtures
```

## Cargar fixtures

```bash
php bin/console doctrine:fixtures:load
```

---

# COMANDOS PERSONALIZADOS

## Crear comando personalizado

```bash
php bin/console make:command AppCommand
```

---

# SERVIDOR DE DESARROLLO

## Symfony CLI

```bash
symfony server:start
```

## PHP embebido

```bash
php -S localhost:8000 -t public/
```

---

# LOGS

## Windows (XAMPP)

```bash
type var/log/dev.log
```

## Linux / Mac

```bash
tail -f var/log/dev.log
```

---

# DEPENDENCIAS COMUNES

## Paginación

```bash
composer require knplabs/knp-paginator-bundle
```

## Manejo de fechas

```bash
composer require nesbot/carbon
```

## Debug (desarrollo)

```bash
composer require --dev symfony/debug-bundle
```

## Maker Bundle (desarrollo)

```bash
composer require --dev symfony/maker-bundle
```

## Doctrine ORM

```bash
composer require symfony/orm-pack
```

## Fixtures

```bash
composer require --dev doctrine/doctrine-fixtures-bundle
```

---

# NOTAS IMPORTANTES

## Después de modificar una entidad

```bash
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```

## Si aparecen errores extraños

```bash
php bin/console cache:clear
```

## Verificar rutas nuevas

```bash
php bin/console debug:router
```

---

# CONVENCIONES DE NOMENCLATURA

## Rutas Twig

```twig
{{ path('app_productos_index') }}
{{ path('app_productos_show', {'id': producto.id}) }}
```

Formato recomendado:

```text
app_nombre_recurso_accion
```

Ejemplos:

```text
app_productos_index
app_productos_new
app_productos_edit
app_categoria_index
app_home
```

---

## Controladores

```text
ProductosController
CategoriaController
HomeController
```

## Entidades

```text
Productos
Categoria
User
```

## Repositorios

```text
ProductosRepository
CategoriaRepository
```

## Formularios

```text
ProductosType
CategoriaType
```

## Vistas

```text
templates/productos/index.html.twig
templates/productos/show.html.twig
templates/categoria/index.html.twig
templates/home/index.html.twig
```
