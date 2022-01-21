# Zajęcia 10


### Publikacja obrazu dockera w Registry

Budujemy obraz:

```console
user@host:~$ sudo docker build . -t twojlogin/obraz:tag
user@host:~$ sudo docker login #logowanie do registry
user@host:~$ sudo docker push twojlogin/obraz:tag

```


### Publikacja pakietu PyPi

W pliku *~/.pypirc* dodajemy token wygenerowany przez stronę PyPi:

```
[pypi]
	username = __token__
	password = TWOJ_TOKEN
```

W katalogu z modulem i setup.py wykonujemy kolejno (w virtualenv):

```console
user@host:~$ python setup.py sdist bdist_wheel
user@host:~$ pip install twine
user@host:~$ twine upload dist/*
```


### GitHub Actions

W katalogu *.github/workflows* tworzymy plik .yml (Zobacz sekcję Action w repozytorium i Marketplace na GH):

przykładowy plik.yml:

```yml
name: Python application

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.9ggg
      uses: actions/setup-python@v2
      with:
        python-version: "3.9"
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
    - name: test
      run: |
        make test
```


---
