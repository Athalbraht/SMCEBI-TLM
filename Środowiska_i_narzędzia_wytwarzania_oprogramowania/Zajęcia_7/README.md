# Zajęcia 7

---

- [Zadania](#Zadania)

---

## Zadania 1ptk

#### materiały 

- [Struktura modułów Python](https://docs.python.org/3/tutorial/modules.html)
- [setuptools](https://www.youtube.com/watch?v=GaWs-LenLYE)
- [Docstring](https://www.datacamp.com/community/tutorials/docstrings-python)
- [PYPI](https://pypi.org/)
- [Virtualenv](https://pythonbasics.org/virtualenv/)

 > Po zalogowaniu na **INF-VM** wyświetlone zostają 2 porty użytkownika: **80X8** oraz **81X8** (*X - numer uniwersalny dla każdego użytkownika*). Porty widoczne są w sieci **UŚ** pod adresem komputera **INF-VM**. Dodatkowo port **80X8** ma ustawione publiczne **reverse proxy** na port 80 (usługi http postawione na porcie **80X8** widoczne są w internecie pod adresem **http://studX.fenu-experiment.pl**, użyj http nie https). Aktualizacja zawartości strony może przebiegać z opóżnieniem (przyśpieszenie po ustawieniu **DNS** na **1.1.1.1** lub **DoH** na serwery **CloudFlare**).  

> W razie problemów z podpisem commitów `user@host:~$ git commit -S -m "opis"` wykonaj polecenie: `user@host:~$ fix-gpg`

1. Użyj opcji **fork** (github) na [repozytorium](https://github.com/SMCEBI-didactics/WebApplication).
![fork](../.pictures/fork.png)
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

![pullrequest](../.pictures/fork-pr.png)
 
 
---
