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
  - A `down` állítja le  és törli a konténereket az adott mappában.


## Indítás

  _Lépj bele a Dockerfile mappájába `cd /dir/names/`_

  ```bash
  docker compose up -d
  ```

  - Az `up` indítja el a konténer(eke)t a Dockerfile(ok)ból, ha még nem volt build, akkor a build(ek) is lefut(nak).

  - A `-d` hatására a háttérben indul(nak), így visszakapjuk a konzolt.
    
