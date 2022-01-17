# Zajęcia 8 i 9

---

### Generowanie dokumentacji pdoc3

W katalogu *MyCode/* znajduje się kod źródłowy opisany przez docstrings.

W celu wygenerowania dokumentacji należy wpisać:

```console
user@host:~$ pdoc3 --html <ścieżka do folderu z modułem> #np pdoc3 --html MyCode/
```

Wygenerowane zostaję pliki *.html* w folderze *html/MyCode/*. 


### Generowanie dokumentacji Sphinx

Aby wygenerować dokumentację przy pomocy *Sphinx* należy wykonać kolejno:

- stworzyć folder np. *docs*.
- wewnątrz folderu wykonać polecenie `sphinx-quickstart` (można użyć domyślnych ustawień). 
- w wygenerowanym pliku *conf.py* odkomentować linie 13-15:

```python
import os
import sys
sys.path.insert(0, os.path.abspath('WZGLĘDNA ŚCIEŻKA DO KODU'))

```

- w linii 33 dodać `extensions = ["sphinx.ext.autodoc"]`
- generacja dokumentacji na podstawie docstrings odbywa się po wykonaniu polecenia `sphinx-apidoc -o . <względna ścieżka do kodu>` (np. `sphinx-apidoc -o . ../MyCode`)
- W pliku `index.rst` można opisać stronę główną oraz dodać podstrony w formacie [reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)
- budowa dokumentacji w formacie *.html* odbywa się po wpisaniu `make html` (pliki znajdują się w *build/html/*)




---


### Zadanie 2ptk

- W repozytorium [LINK](https://github.com/SMCEBI-didactics/SiNWO-140122) stwórz plik setup-TWOJLOGIN.py instalujący moduł *Modul* (uzupełnij funkcję setup() o parametry: name, description, version, author, author\_email, `packages=['module']` zgodnie z wzorem z poprzedniego zadania), Zatwierdź zmiany w gałęzi *dev-TWOJLOGIN*
- W funkcji *setup()* dodaj parametr `entry_point={'console_scripts': ['zadanie8-twojlogin = modul.func:time']}`pozwalający na uruchamianie funkcji time jako polecenie powłoki. Zatwierdź zmiany
- zainstaluj moduł w wirtualnym  środowisku i przetestuj działanie polecenia `zadanie8-twojlogin >> output.txt`.Zatwierdź zamiany
- dodaj plik requirements.txt i dodaj w nim zależność *click* (instalacja zależności przez `pip install -r requirements.txt`). Zatwierdź zmiany.
- Uzupełnij docstringi funkcji i klas w kodzie *Module* i wygeneruj dokumentację przy pomocy pdoc w folderze *docs-TOWJLOGIN*. Zatwierdz zmiany i wypchnij gałąź.
- przełącz się na gałąź *dev-2-TWOJLOGIN*
- stwórz plik makefile instalujący pakiet w wirtualnym środowisku  wraz z zależnością z requirements.txt, uruchamiający polecenie powłoki a następnie dezaktywujący środowisko wirtualne przez polecenie `make run`. [Materiał pomocniczy](https://www.youtube.com/watch?v=VCmWzYHh7Y8)
- Dodaj opcje wykonania `make clear` usuwające katalog z środowiskiem wirtualnym. Zatwierdź zmiany (upewnij się, że nie wysyłasz katalogu z virtualenv)
- Wypchnij zmiany do *dev-2-TWOJLOGIN*
- Na githubie wykonaj pull request gałęzi *dev-TWOJLOGIN*. Użyj panelu bocznego, aby podlinkować *issues*  (issue-TWOJEIMIE) oraz milestone (zadanie 8)
- Otwórz sekcję z pull request i znajdź request od innego użytkownika (jeśli istnieje) i wykonaj code review z pozytywnym zatwierdzeniem zmian. 


---




