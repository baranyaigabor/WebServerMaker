#!/bin/bash

set -e

clear

if ! git clone https://github.com/rcsnjszg/webserver2024/; then
    echo "Failed to clone repository."
    exit 1
fi

cd webserver2024/ 

if ! mv .env-example .env; then
    echo "Failed to move .env-example to .env."
    exit 1
fi

if ! docker compose up -d; then
    echo "Failed to start Docker container."
    exit 1
fi

cd ..

if ! php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; then
    echo "Failed to download Composer installer."
    exit 1
fi

if ! php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; then
    echo "Installer corrupt."
    exit 1
fi

if ! php composer-setup.php; then
    echo "Failed to run Composer installer."
    exit 1
fi

php -r "unlink('composer-setup.php');"

if ! php composer.phar require fakerphp/faker; then
    echo "Failed to require fakerphp/faker."
    exit 1
fi

if ! php composer.phar dump-autoload; then
    echo "Failed to dump autoload."
    exit 1
fi

if ! php composer.phar require filp/whoops; then
    echo "Failed to require filp/whoops."
    exit 1
fi

if ! mv vendor webserver2024/www/; then
    echo "Failed to move vendor directory."
    exit 1
fi

cd webserver2024/www/

if ! touch index.php; then
    echo "Failed to create index.php file."
    exit 1
fi

touch index.php
echo "<?php
declare(strict_types=1);
ini_set('display_errors', 1);
error_reporting(E_ALL);\n
require __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/vendor/composer/autoload_real.php';\n
use Faker\Factory;
use Acme\\Namespace\\osztalyNev;
use Whoops\\Run;
use Whoops\\Handler\\PrettyPageHandler;\n
\$faker = Factory::create();
\$whoops = new Run();
\$whoops->pushHandler(new PrettyPageHandler());
\$whoops->register();
?>
" >> index.php
cd ../..

if ! touch composer.json; then
    echo "Failed to create composer.json file."
    exit 1
fi

touch composer.json
truncate -s 0 composer.json
echo '{
    "require": {
        "fakerphp/faker": "^1.24",
        "filp/whoops": "^2.18"
    },
    "autoload": {
        "psr-4": {
            "Acme\\\\namespace": "src/Acme/namespace"
        }
    }
}' >> composer.json

if ! mv composer.json webserver2024/www/; then
    echo "Failed to move composer.json."
    exit 1
fi

if ! mv composer.lock webserver2024/www/; then
    echo "Failed to move composer.lock."
    exit 1
fi

if ! mv composer.phar webserver2024/www/; then
    echo "Failed to move composer.phar."
    exit 1
fi

cd webserver2024/www/

if ! mkdir -p src/Acme/Namespace; then
    echo "Failed to create src/Acme/Namespace directory."
    exit 1
fi





