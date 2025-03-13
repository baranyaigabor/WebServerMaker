# NGiNX és PHP 8.3 webszerver docker alapokon

## Webserver elkészítés

1. Hozd létre a projektmappádat
2. Nyisd meg VS Code-ban
3. Nyiss egy új terminált
4. Másold be az egész bash scriptet

A böngészőben `localhost`-ra keresve találod a weboldalad!

Indításhoz és leállításhoz is mindig legyél a Dockerfile mappájában,
jelen esetben: ./webserver2024/docker/php 

## Leállítás

Ha befejzted a coding session-t, állítsd le a Dockerfile-t,
különben a háttérben fölöslegesen futni fog.


  ```bash
  docker compose down
  ```
  - A `down` állítja le  és törli a konténereket


## Indítás

  Ha már 

  ```bash
  docker compose up -d
  ```

  - Az `up` indítja el a konténereket, ha még nem volt build, akkor a build is lefut.

  - A `-d` hatására a háttérben indul, visszakapjuk a konzolt.
    
