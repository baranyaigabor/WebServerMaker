clear
git clone https://github.com/rcsnjszg/webserver2024/
cd webserver2024/ 
mv .env-example .env
docker compose up -d
cd ..
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar require fakerphp/faker
php Composer.phar dump-autoload 
php composer.phar require filp/whoops
cd webserver2024/www/
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
touch composer.json
truncate -s 0 composer.json
echo '{
    "require": {
        "filp/whoops": "^2.17",
        "fakerphp/faker": "^1.24"
    },
    "autoload": {
        "psr-4": {
            "Acme\\\\namespace": "src/Acme/namespace"
        }
    }
}' >> composer.json
mv composer.json webserver2024/www/
mv composer.lock webserver2024/www/
mv composer.phar webserver2024/www/
