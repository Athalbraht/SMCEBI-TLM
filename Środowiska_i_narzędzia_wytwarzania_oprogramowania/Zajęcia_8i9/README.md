

---

### Generowanie dokumentacji pdoc3

W katalogu *MyCode/* znajduje się kod źródłowy opisany przez docstrings.

W celu wygenerowania dokumentacji należy wpisać:

```console
user@host:~$ pdoc3 --html <ścieżka do folderu z modułem> #np pdoc3 --html MyCode/
```

Wygenerowane zostają pliki *.html* w folderze *html/MyCode/*. 


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
- generacja dokumentacji na podstawie docstrings odbywa się po wykonaniu polecenia `sphinx-apidoc -o . <względna ścieżka do kodu>` (np. `sphinx-apidoc -o . ../MyCode`). Wygenerowane pliki .rst zawierają informację o strukturze programu.
- W pliku `index.rst` można opisać stronę główną oraz dodać podstrony w formacie [reStructuredText](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)
- budowa dokumentacji w formacie *.html* odbywa się po wpisaniu `make html` (pliki znajdują się w *build/html/*)




---






