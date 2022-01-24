# Zajęcia 4

---

- [Podsumowanie](#Podsumowanie)
- [Zadania](#Zadania)

---

## Podsumowanie

Użyte polecenia:

[dokumentacja](https://docs.docker.com/)

##### Uruchom POLECENIE jako administrator

```console
user@host:~$ sudo POLECENIE
```

##### Użyte polecenia: Docker

```console
user@host:~$ sudo docker POLECENIE
```

- RUN tworzy kontener
- IMAGES wyświetl dostępne obrazy
- PS wyświetl działające kontenery
- PULL pobierz obraz z registry
- BUILD zbuduj obraz na podstawie Dockerfile
- COMMIT stwórz obraz z kontenera

##### Użyte części składni Dockerfile

- FROM
- WORKDIR
- RUN
- COPY
- ADD
- CMD
- ENTRYPOINT




---

## Zadania

- 1ptk
	1. Poczytaj o szkole pracy z oprogramowaniem GIT-FLOW 
	2. Załóż konto na [Docker HUB](https://hub.docker/com)
	3. Stwórz lokalne repozytorium o nazwie dockerfiles
	4. Wyodrębnij gałąź dev-TWOJLOGIN
	5. Dodaj alias repozytroium zdalnego `git@github.com:SMCEBI-didactics/SiNWO-261121.git` (Wymaga potwierdzenia zaproszeń wysłanych 19.10.21)
	4. W gałęzi `dev-TWOJLOGIN` w folderze `/TWOJLOGIN` dodaj plik Dockerfile budujący obraz:
		- bazujący na dystrybucji alpine w wersji 3.15. **FROM**
		- używając managera pakietów [apk](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management) dodaj pakiet  `bash`, `wget`. **RUN**
		- skopiuj lokalny plik `~/.bashrc` do katalogu `/root/`. **COPY**
		- pobierz do katalogu `/root/` [plik](https://raw.githubusercontent.com/aszadzinski/SMCEBI-TLM/master/%C5%9Arodowiska_i_narz%C4%99dzia_wytwarzania_oprogramowania/Zaj%C4%99cia_4/runme). **ADD/wget**
		- dodaj uprawnienia pozwalające na wykonanie pobranego programu `runme` (polecenie `chmod +x PLIK`). **RUN**
		- używając `ENTRYPOINT` wykonaj pobrany program `runme` z flagą `-v` oraz możliwością dawania własnych przez polecenie `docker run OBRAZ -dodatkowe_flagi`. **ENTRYPOINT**
	5. Zbuduj obraz tagując go jako: `zadanie4-NAZWISKO:v1.0` (podpowiedź: skopiuj plik .bashrc do miejsca z którego budujesz obraz, CONTEX) i uruchom go w folderze, gdzie znajduje się  `Dockerfile` z przekierowaniem wyjścia do pliku `output1.txt` i `output2.txt` (z flagą `-v` oraz z flagami `-v`, `-f`). `sudo docker run OBRAZ >> OUTPUT_FILE`
	6. Zatwierdź zmiany oraz wyślij do repozytorium zdalnego (do gałęzi dev-TWOJLOGIN)
	7. otaguj commit v1.0-TWOJLOGIN i wyślij tagi do repo zdalnego
	7. Wykonaj pull request do gałęzi `main` z poziomu githuba

---
