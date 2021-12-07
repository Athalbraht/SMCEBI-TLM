# Zajęcia 6

---

- [Podsumowanie](#Podsumowanie)
- [Zadania](#Zadania)

---

## Podsumowanie

### docker-compose

Narzędzie do uruchamiania wielokontenerowych aplikacji.

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

## Zadania

TmllIFR5bSBSYXplbQo=


---
