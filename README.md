# NGiNX és PHP 8.3 Webszerver Docker alapokon

## Webserver elkészítés

1. Nyisd meg VS Code-ban a projektmappádat
2. Másold be a terminálba alábbi bash scriptet:

  ```bash
  curl -fsSL https://raw.githubusercontent.com/baranyaigabor/WebServerMaker/main/install.sh | sh
  ```

  - Böngészőben a `localhost`-ra keresve találod a weboldalad!
    

## Indítás

  ```bash
  cd webserver2024/docker/php && docker compose up -d
  ```

  - Az `up` indítja el a konténer(eke)t a Dockerfile(ok)ból, ha még nem volt build, akkor a build(ek) is lefut(nak).

  - A `-d` hatására a háttérben indul(nak), így visszakapjuk a konzolt.
    

## Csatlakozás a konténerhez

```bash
docker compose exec app fish
```

- A fenti parancs az `app` nevű szolgáltatáshoz tartozó konténeren belül futtatja a fish nevű shellt. Ezen belül lehet elérni többek között a composert.

- Az `app` helyére a szolgáltatása neve kerül: `app` vagy `web` attól függően, hogy melyik konténert szeretnénk elérni.
Kilépni az `exit` paranccsal lehet.


## Leállítás

  ```bash
  cd webserver2024/docker/php && docker compose down
  ```
  - A `down` állítja le  és törli a konténereket az adott mappában.
    

## Hibakeresés és logolás

A futó konténerek ellenőrzése:

```bash
docker compose ps
```

- Amennyiben nem fut a kettő (`web`,`app`) közül az egyik, úgy érdemes megnézni a logfájlokat.

```bash
docker compose logs
```

- A fenti parancs az összes konténer által logolt adatot megmutatja.

```bash
docker compose logs web -f
```

- A fenti parancs folyamatosan mutatja a `web` szolgáltatása, azaz a webszerver log adatait.
- Itt látható, ha valaki betölti valamelyik oldalt.
- Kilépni a `ctrl`+`c`-vel lehet.

    
