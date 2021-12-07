# Zajęcia 1

---

- [Podsumowanie](#Podsumowanie)
- [Zadania](#Zadania)

---

## Podsumowanie

### docker-compose

Narzędzie do uruchamiania wielo-kontenerowych aplikacji.

Podobnie jak w przypadku uruchamiania pojedynczego kontenera w katalogu roboczym musi znajdować się plik `docker-compose.yml`.  Uruchomienie następuje przez polecenie:

```bash
$: sudo docker-compose up # -d aby odczepić sesje 
```

W przypadku braku zdefiniowanych nazw kontenerów następuje ich  automatyczne przypisanie zgodnie z wzorem _katalog-obraz-nr_.

#### Przykład docker-compose.yml

Pełna lista wyrażeń [LINK](https://docs.docker.com/compose/compose-file/compose-file-v3/)

```yml
version: "3.8"
services:
  con1:
    image: MYIMAGE
    container_name: myname
    networks:
      - my-net	
    environment:
      - VAR: foo
    ports:
      - 8080:80
    volumes:
      - my-vol:/data/
  con2:
    image: MYIMAGE-db
    networks:
      - my-net	
    environment:
	- USER: admin
	- PASSWD: changeme
    ports:
      - 3307:3306
    volumes:
      - /home/user/db/:/data/
networks:
  my-net:
    driver: bridge
volumes:
  my-vol: 
```

Jest tożsame z poleceniami:

```bash
$: sudo docker network  create my-net
$: sudo docker volume create my-vol
$: sudo docker run  -p8080:80 -n my-net -v my-vol:/data/ -e VAR=foo -d --name myname MYIMAGE
$: sudo docker run -p 3307:3306 -n my-net -v /home/user/db/:/data/ -e USER=admin -e PASSWD=changeme -d MYIMAGE-db
```

---

## Zadania 1ptk

- Popraw plik Dockerfile znajdujący się w repozytorium 
	- użyj opcji FORK
	- w ramach własnego zforkowanego repozytorium stwórz folder (twoje nazwisko) i skopiuj zawartość folderu *do poprawy*
	- Popraw błąd w pliku Dockerfile i zmodyfikuj index.html zgodnie z zawartością
	- zbuduj obraz o nazwie z6-TWOJENAZWISKO
	- Zawierdź i wyślij zmiany
- Stwórz aplikację przy pomocy docker-compose:
	- opartą na 3 obrazach: mariadb, adminer, z6-TWOJENAZWISKO
	- kontenery podłączone są do sieci net-TWOJENAZWSKO
	- mariadb oraz z6-TWOJENAZWISKO mają wspólny volumen vol-TWOJENAZWISKO zamontowany w /data/
	- Aplikacja posiada wystawione porty dla z6-TWOJENAZWISKO (80X8 <- 5000) i adminera (81X8 <- 8080) (Uzyj dwóch portów przydzielonych ci podczas zajęć)
	- Uruchom aplikację 
	- Zatwierdź i wyślij zmiany








---
