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
$: sudo docker-compose up # -d aby odczepic sesje 
```

W przypadku braku zdefiniowanych nazw kontenerów następuje ich  automatyczne przypisanie zgodnie z wzorem _katalog-obraz-nr_.

#### Przykład docker-compose.yml

```
```

Jest tożsame z poleceniami:

```bash
$: sudo docker network  create my-net
$: sudo docker volume create my-vol
$: sudo docker run  -p8080:80 -n my-net -v my-vol:/data/ -e VAR=foo -d MYIMAGE
$: sudo docker run -p 3307:3306 -n my-net -v /home/user/db/:/data/ -e USER=admin -e PASSWD=changeme -d MYIMAGE-db
```

---

## Zadania



---
