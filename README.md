# NGiNX és PHP 8.3 Webszerver Docker alapokon

## Webserver elkészítés

1. Nyisd meg VS Code-ban a projektmappádat
2. Terminálba másold be az egész bash scriptet

- Böngészőben a `localhost`-ra keresve találod a weboldalad!

- Indításhoz és leállításhoz is mindig legyél a Dockerfile mappájában,
  jelen esetben: _./webserver2024/docker/php/_


## Leállítás

  _Lépj bele a Dockerfile mappájába `cd /dir/names/`_

  ```bash
  docker compose down
  ```
  - A `down` állítja le  és törli a konténereket


## Indítás

  _Lépj bele a Dockerfile mappájába `cd /dir/names/`_

  ```bash
  docker compose up -d
  ```

  - Az `up` indítja el a konténereket, ha még nem volt build, akkor a build is lefut.

  - A `-d` hatására a háttérben indul, visszakapjuk a konzolt.
    
