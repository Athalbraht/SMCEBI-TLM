# Zajęcia 7

---

- [Zadania](#Zadania)

---

## Zadania 1ptk

#### materiały 

[setuptools](https://www.youtube.com/watch?v=GaWs-LenLYE)
[Docstring](https://www.programiz.com/python-programming/docstrings)
[PYPI](https://pypi.org/)
[Virtualenv](https://pythonbasics.org/virtualenv/)



1. Użyj opcji **fork** (github) na [repozutorium](https://github.com/SMCEBI-didactics/WebApp).
2. W ramach własnego forkowanego repozytorium wyodrębnij i przełącz się na **gałąź dev**.
3. Dla aplikacji *Verify* oraz *WebApp* stwórz opisy każdej funkcji (co robi, co przyjmuje, co zwraca) jako python **DocString** w preferowanym przez siebie formacie.
4. Zatwierdź zmiany w gałęzi *dev*.
5. Przełącz się na *gałąź główną*.
6. W katalogu repozytorium (tam gdzie foldery WebApp i Verify) wykonaj polecenie:
```console
user@host:~$ gen-dc
```
7. Zmodyfikuj plik wygenerowany **Dockerfile**, aby uruchamiał aplikację *WebApp* i zbuduj ją na *INF-VM* pod nazwą **z7-TWÓJLOGIN:1.0**
  - aplikacja powinna uruchamiać się prawidłowo dla:
 ```console
 user@host:~$ sudo docker run z7-TWÓJLOGIN:1.0
 #oraz np.
 user@host:~$ sudo docker run -e FLASK_ENV=deve... z7-TWÓJLOGIN:1.0 -h 0.0.0.0 -p 80X8 # 80X8 oznacza twój publiczny port 
 ```
8. Zatwierdź zmiany w *gałęzi głównej*.
9. Wróć do gałęzi *dev*.
10. Wykonaj ponownie polecenie `$: gen-dc`.
11. Zmodyfikuj wygenerowany plik **docker-compose.yml** (adminer(port 81X8) + mariadb) w celu dodania trzeciego kontenera bazującego na twoim obrazie *z7-TWÓJLOGIN*. Ustaw zmienne środowiskowe i parametry, aby pomyślnie nasłuchiwał na przydzielonym ci publicznym porcie (**80X8**). 
12. Zatwierdź zmiany i wypchnij gałąź do zdalnego repozytorium.
13. Wykonaj merge z gałęzi dev do głównej (Użyj funkcji **rebase**, aby zmienić kolejność commitów), wypchnij zmiany do zdalnego repozytorium wraz z tagiem *v1.0-TWÓJLOGIN*.
14. Z gałęzi głównej wyodrębnij i przełącz się na branch *dev-verify*.
15. Uzupełnij poprawnie plik **setup.py** w aplikacji **Verify**.
16. Zatwierdź zmiany.
17. W katalogu aplikacji stwórz wirtualne środowisko dla interpretera python:
```console
user@host:~$ virtualenv venv #pojawia się folder venv 
#aktywacja środowiska
user@host:~$ source venv/bin/activate
#dezaktywacja
(venv) user@host:~$ deactivate
```
18. Aktywuj środowisko i spraw, aby folder **venv/** nie był uwzględniany w commitach. 
19. W wirtualnym środowisku zainstaluj wszystkie zależności programu (program pip)
20. Wykonaj polecenie `(venv) user@host:~$ pip freeze > requirements.txt`.
21. Zainstaluj moduł przy użyciu *setuptools* `sudo python3 setup install`.
22. W pliku `output.txt` zapisz *sól* oraz *hash* zwracany przez  *Verify* dla wejściowej zmiennej *TWÓJLOGIN* (użyj polecenia `verify` lub wywołaj kluczową funkcję przez interpreter).
23. Dezaktywuj wirtualne środowisko, zatwierdź i wypchnij zmiany do zdalnego repozytorium.
24. Wykonaj merge z *dev-verify* do gałęzi głównej i wypchnij zmiany repozytorium. 
25. Wykonaj **pull request** w źródłowym [repozytorium](https://github.com/SMCEBI-didactics/WebApp) używając swojego forka (nie merguj).

 
 
 


---
