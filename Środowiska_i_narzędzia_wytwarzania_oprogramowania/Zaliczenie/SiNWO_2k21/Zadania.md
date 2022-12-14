# Zadania ŚiNWO 2021

---

### Zadanie 7

- W repozytorium [LINK](https://github.com/SMCEBI-didactics/SiNWO-140122) stwórz plik *setup-TWOJLOGIN.py* instalujący moduł **Module** (uzupełnij funkcję *setup()* o parametry: name, description, version, author, author\_email, `packages=['Module']` zgodnie z wzorem z poprzedniego zadania), Zatwierdź zmiany w gałęzi *dev-TWOJLOGIN*
- W funkcji *setup()* dodaj parametr `entry_point={'console_scripts': ['zadanie8-twojlogin = modul.func:time']}` pozwalający na uruchamianie funkcji *time()* jako polecenie powłoki. Zatwierdź zmiany
- zainstaluj moduł w wirtualnym  środowisku i przetestuj działanie polecenia `zadanie8-twojlogin >> output.txt`.Zatwierdź zamiany
- dodaj plik requirements.txt i dodaj w nim zależność *click* (instalacja zależności przez `pip install -r requirements.txt`). Zatwierdź zmiany.
- Uzupełnij docstringi funkcji i klas w kodzie *Module* i wygeneruj dokumentację przy pomocy **pdoc** w folderze *docs-TWOJLOGIN*. Zatwierdz zmiany i wypchnij gałąź.
- przełącz się na gałąź *dev-2-TWOJLOGIN*
- stwórz plik *makefile* instalujący pakiet w wirtualnym środowisku  wraz z zależnością z requirements.txt, uruchamiający polecenie powłoki a następnie dezaktywujący środowisko wirtualne. Polecenia powinny wykonać się po wpisaniu `make run`. [Materiał pomocniczy](https://www.youtube.com/watch?v=VCmWzYHh7Y8)
- Dodaj możliwość wykonania polecenia `make clear` po którym usuwany jest katalog z środowiskiem wirtualnym. Zatwierdź zmiany (upewnij się, że nie wysyłasz katalogu z virtualenv, w tym celu edytuj gitignore)
- Stwórz Dockerfile uruchamiający polecenie powłoki `zadanie8-twojlogin` z użyciem napisanego *Makefile* (bazuj na obrazie ubuntu, zainstaluj niezbędne pakiety)
- Wypchnij zmiany do *dev-2-TWOJLOGIN*
- Na githubie wykonaj **Pull request** z gałęzi *dev-TWOJLOGIN*. Użyj panelu bocznego, aby podlinkować *Issues*  (użyj issue-TWOJEIMIE) oraz *milestone* (zadanie 8)
- Otwórz sekcję z **Pull requests** i znajdź request od innego użytkownika (jeśli istnieje). Wykonaj code review z pozytywnym zatwierdzeniem zmian. 

**podpowiedź**: w przypadku problemow z uruchomieniem virtualenv przez makefile, stworz osobny skrypt tworzacy srodowisko, instalujacy program i wykonujacy zadanie8-twojlogin. Odwołaj sie do niego przez `source skrypt` w Makefile. Uwaga: make używa /bin/sh zamiast bash. dodaj `SHELL := /bin/bash` w Makefile, aby source zadziałał

```bash
#!/bin/bash

#pamietaj o chmod +x skrypt

virtualenv venv
source venv/bin/activate
pip install -r req...
python setup-xxx.py install
itd.
```

```make

SHELL := /bin/bash

run:
    source skrypt

clear:
    commands

```
### Tematy projektów

[LINK](https://albert.szadzinski.pl/SMCEBI-TLM/%C5%9Arodowiska_i_narz%C4%99dzia_wytwarzania_oprogramowania/Zaliczenie/2021.html)

---

## Zadanie 6
 > Po zalogowaniu na **INF-VM** wyświetlone zostają 2 porty użytkownika: **80X8** oraz **81X8** (*X - numer uniwersalny dla każdego użytkownika*). Porty widoczne są w sieci **UŚ** pod adresem komputera **INF-VM**. Dodatkowo port **80X8** ma ustawione publiczne **reverse proxy** na port 80 (usługi http postawione na porcie **80X8** widoczne są w internecie pod adresem **http://studX.fenu-experiment.pl**, użyj http nie https). Aktualizacja zawartości strony może przebiegać z opóżnieniem (przyśpieszenie po ustawieniu **DNS** na **1.1.1.1** lub **DoH** na serwery **CloudFlare**).  

> W razie problemów z podpisem commitów `user@host:~$ git commit -S -m "opis"` wykonaj polecenie: `user@host:~$ fix-gpg`

1. Użyj opcji **fork** (github) na [repozytorium](https://github.com/SMCEBI-didactics/WebApplication).
![fork](https://raw.githubusercontent.com/aszadzinski/SMCEBI-TLM/master/%C5%9Arodowiska_i_narz%C4%99dzia_wytwarzania_oprogramowania/.pictures/fork.png)
2. W ramach własnego forkowanego repozytorium wyodrębnij i przełącz się na **gałąź dev**.
3. Dla aplikacji **Verify** oraz **WebApp** stwórz opisy każdej funkcji (co robi, co przyjmuje, co zwraca) jako python **DocString** w preferowanym przez siebie formacie (np. SphinxStyle, GoogleStyle itp.).
4. Zatwierdź zmiany w gałęzi **dev** (Opisz: *"Dodano Docstring"*). Podpisz commit swoim kluczem *GPG* (podpisz wszystkie późniejsze commity) 
5. Przełącz się na **gałąź główną main**.
6. W katalogu repozytorium (tam gdzie foldery WebApp i Verify) **wykonaj polecenie:**
```console
user@host:~$ gen-dc #generuje plik Dockerfile
```
7. Zmodyfikuj wygenerowany **Dockerfile**, aby uruchamiał aplikację **WebApp** (przeczytaj **README.md**) i zbuduj ją na **INF-VM** pod nazwą **z7-TWÓJLOGIN:1.0**
  - aplikacja powinna uruchamiać się prawidłowo dla:
 ```console
 user@host:~$ sudo docker run --rm z7-TWÓJLOGIN:1.0 # nasluchiwanie na localhost:5000
 #oraz
 user@host:~$ sudo docker run --rm -e FLASK_RUN_PORT=9999 z7-TWÓJLOGIN:1.0 #nasluchiwanie na localhost:9999, 9999 to port wewnątrz kontenera
 #oraz
 user@host:~$ sudo docker run --rm -e FLASK_ENV=development -p 80X8:PORT-WEWNETRZNY z7-TWÓJLOGIN:1.0 -h 0.0.0.0 -p PORT-WEWNETRZNY # 80X8 oznacza twój publiczny port,  sprawdź czy strona działa na twoim adresie http://studX.fenu-experiment.pl/login
 ```
8. Zatwierdź zmiany w gałęzi **main** (*"Dodano Dockerfile"*).
9. Wróć do gałęzi **dev**.
11. Zmodyfikuj  plik **docker-compose.yml** (adminer(port 81X8) + mariadb) w celu dodania trzeciego kontenera bazującego na twoim obrazie **z7-TWÓJLOGIN**. Ustaw zmienne środowiskowe i porty, aby pomyślnie nasłuchiwał na przydzielonym ci publicznym porcie (**80X8** ). Użyj zmiennych środowiskowych `FLASK_RUN_HOST=`, `FLASK_RUN_PORT=`, `FLASK_ENV=development`. 
12. **Zatwierdź** zmiany (*"Aktualizacja docker-compose.yml"*) i **wypchnij** gałąź do zdalnego repozytorium.
13. Wykonaj **merge** (napraw konflikt) z gałęzi **dev** do głównej **main**, **wypchnij** gałąź główną do zdalnego repozytorium wraz z tagiem **v1.0-TWÓJLOGIN**.
14. Z gałęzi **main** wyodrębnij i przełącz się na branch **dev-verify**.
15. Uzupełnij braki w pliku **setup.py** w aplikacji **Verify**.
16. **Zatwierdź** zmiany (*"Aktualizacja setup.py"*).
17. Przełącz się chwilowo na gałąź **main** i wykonaj polecenie `user@host:~$: addch` w katalogu *Verify* (generuje plik CHANGELOG). Zatwierdź zmiany (*"Dodano CHANGELOG"*) i wróć do gałęzi **dev-verify**
18. W katalogu aplikacji stwórz **wirtualne środowisko** dla interpretera python:
```console
user@host:~$ virtualenv venv #pojawia się folder venv 
#aktywacja środowiska
user@host:~$ source venv/bin/activate
#dezaktywacja
(venv) user@host:~$ deactivate
```
19. **Aktywuj** środowisko.
20. W wirtualnym środowisku zainstaluj wszystkie zależności programu **Verify** (program **pip** i plik **requirements.txt**)
21. Wykonaj **polecenie** `(venv) user@host:~$ pip freeze > requirements.txt` w katalogu *Verify* (nadpisz istniejący requirements.txt).
22. Zainstaluj moduł przy użyciu **setuptools** `python3 setup install`. 
23. Spraw aby folder **venv** oraz wygenerowane przy instalacji dodatkowe katalogi (**pycache, dist, build, eggs itp.**) nie były włączane do commita.
24. W pliku `output.txt` zapisz **sól** oraz **hash** zwracany przez  **Verify** dla wejściowej zmiennej **TWÓJLOGIN** (użyj polecenia `verify` i przekierowania do pliku lub napisz skrypt `test.py` wywołujący funkcję i zapisujący do pliku).
25. Dezaktywuj wirtualne środowisko, **zatwierdź** (*"Dodano .gitignore, requirements.txt, output.txt"*) i **wypchnij** zmiany do zdalnego repozytorium.
26. Wykonaj **merge** z **dev-verify** do **main**. Użyj funkcji **rebase**, aby zmienić kolejność commitów . Wypchnij zmiany do zdalnego repozytorium wraz z tagiem *v1.1-TWÓJLOGIN*. 
27. Wykonaj **pull request** w źródłowym [repozytorium](https://github.com/SMCEBI-didactics/WebApplication) używając swojego forka.

![pullrequest](https://raw.githubusercontent.com/aszadzinski/SMCEBI-TLM/master/%C5%9Arodowiska_i_narz%C4%99dzia_wytwarzania_oprogramowania/.pictures/fork-pr.png)
 
---

## Zadanie 5

TmllIFR5bSBSYXplbQo=

---

## Zadanie 4

VyB0eW0gdHlnb2RuaXUgYnJhayA=

---

## Zadanie 3

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

## Zadanie 2

- 1ptk
	1. Zainicjuj repozytorium dla dowolnie wybranego przez siebie programu (najlepiej powiązanego z umiejętnościami/zainteresowaniami, na podstawie, którego stworzone zostaną tematy projektów). Git powinien być poprawnie skonfigurowany, aby github poprawnie identyfikował [tożsamość](#Konfiguracja-środowiska). Jeśli posiadasz już repozytorium upewnij się tylko czy spełnione są pozostałe punkty.
	2. Dodaj commit inicjujący np. "My first commit"
	3. Dodaj plik README.md (markdown) z nazwą i krótkim opisem czego dotyczy program. Dodaj commit.
	4. Dodaj plik `.gitignore` z co najmniej 1 wpisem dla niechcianych plików typowych dla danego języka. Dodaj commit podpisany kluczem GPG.
	5. Wyślij zmiany do repozytorium zdalnego. Jeśli nie chcesz, aby program był publiczny, dodaj go na własnym koncie w repozytorium prywatnym i dodaj użytkownika **aszadzinski** jako kontrybutor.
	6. Dodaj plik `LICENSE` z poziomu interfejsu githuba.
	7. Zaktualizuj swoje repozytorium lokalne o ten plik.
	8. Stwórz gałąź np. dev i dodaj w niej plik np. CHANGELOG z treścią. Spraw, aby gałąź była widoczna z poziomu repozytorium zdalnego.
	9. W gałęzi głównej stwórz ten sam plik z inną treścią, zacommituj i dodaj zmiany z gałęzi stworzonej wcześniej (dev). Wyślij wszystkie zmiany do repozytorium zdalnego.
	10. Otaguj ostatni commit o wersję np. v1.0 i wyślij tagi do repo zdalnego.
	11. Jeśli nie chcesz, dodawać zmian w swojej gałęzi głównej, wyodrębnij z niej gałąź *semi-master* i traktuj jako główna (tzn. z niej wyodrębniaj inne gałęzie i w nią scalaj zmiany, po zajęciach możesz ją usunąć).
- Poczytaj o szkole pracy z oprogramowaniem GIT-FLOW

---

## Zadanie 1

1. Załóż konto na [githubie](https://github.com/signup) *0ptk*
	- dodaj wygenerowane klucze GPG i SSH w ustawieniach swojego konta
	- dodaj gwiazdkę lub wyślij swoj nick mailowo

![git_star](https://raw.githubusercontent.com/aszadzinski/SMCEBI-TLM/master/%C5%9Arodowiska_i_narz%C4%99dzia_wytwarzania_oprogramowania/.pictures/git_star.png)


2. **dla chętnych**
	- naucz się obslugi managerów plików CLI np. ranger, mc. 
	- jak uruchomić okienkowy edytor plików mając dostęp do serwera tylko po SSH.

---
