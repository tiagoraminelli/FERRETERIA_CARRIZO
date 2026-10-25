<?php
header('Content-Type: text/plain');
echo "PHP: " . PHP_VERSION . "\n";
echo "php.ini: " . php_ini_loaded_file() . "\n";
echo "extension_dir: " . ini_get('extension_dir') . "\n";
echo "pdo_pgsql: " . (extension_loaded('pdo_pgsql') ? 'YES' : 'NO') . "\n";
echo "pgsql: " . (extension_loaded('pgsql') ? 'YES' : 'NO') . "\n";
echo "\nPDO drivers:\n";
print_r(PDO::getAvailableDrivers());
