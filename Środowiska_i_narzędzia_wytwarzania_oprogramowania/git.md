# System kontroli wersji: GIT

---

- Podstawy
		- [Konfiguracja](#Konfiguracja)
		- [Praca na galęzi](#Praca-na-gałęzi)
				* [Inicjalizacja lokalnego repo](#Inicjalizacja-repozytorium-lokalnego-w-folderze-mylocalrepo)
				* [Śledzenie zmian](#Śledzenie-zmian)
				* [Zatwierdzanie (commit)](#Zatwierdzanie-zmian-(commit))
				* [Historia zmian](#Historia-zmian)
				* [Tagowanie](#Tagowanie)
				* [Różniece między commitami](#Pokaż-różnice-między-commitami)
				* [Edycja commitów](#Dopisywanie-i-edycja-commitów)
				* [Odzyskiwanie plików](#Odzyskiwanie-stanu-pojedynczego-pliku)
				* [Reset repozytorium](#Reset-repozytorium)
				* [gitignore](#gitignore)
				* [Inne](#Dodatkowe-polecenia)
		- [Praca z repozytorium zdalnym](#Repozytoria-zdalne)
				* [Klonowanie](#Pobieranie-z-repozytorium-zdalnego-(klonowanie))
				* [Repo na własnym serwerze](#Tworzenie-własnego-repozytorium)
				* [Dodawanie aliasów](#Linkowanie-repozytorium-lokalne-zdalne)
				* [Wysyłanie zmian](#Wysyłanie-zmian-do-repozytorium-zdalnego)
				* [Aktualizacja repozytorium lokalnego](#Aktualizacja-repozytorium-lokalnego)
				* [Wysyłanie tagow](#Wysyłanie-tagów)
		- [Gałęzie](#Gałęzie)
				* [Inicjalizacja gałęzi](#Inicjalizacja-nowej-gałęzi)
				* [Wysyłanie zmian](#Wysyłanie-zmian)
				* [Mergowanie](#Scalanie-zmian)
- Dodatkowe
		- [HEAD](#)
		- [Typy mergów](#)
		- [Przenoszenie indexu między gałęziami]()
		- [Submodule]()
		- [Hooks]()
		- [Modyfikacja plików w indexie]()
		- [Aliasy]()
		- [Najczęściej używane opcje]()
- [Warto doczytać](#Warto-doczytać)

---

## Konfiguracja środowiska (Robimy tylko raz)

```console
user@host:~$ git config PARAMS ARGS
```

**PARAMS** np.:

- `--global`, `--local` ustawienia globalne lub lokalne dla danego repozytorium
- `user.name YOURNAME` nazwa użytkownika
- `user.email EMAIL`
- `user.signingkey ID` ID klucza GPG lub związany z nim e-mail ([Poprzednie zajęcia](shell.md))
- `init.defaultBranch NAME` opcjonalna zmiana nazwy głównej gałęzi (zwykle main/master)

Dane powinny pokrywać się z tymi podanymi na hostingach np. GitHub

## Praca na gałęzi

### Inicjalizacja repozytorium lokalnego w folderze mylocalrepo

```console
user@host:~$ cd mylocalrepo/
user@host:~$ git init
user@host:~$ git config --local user.name aszadzinski #jeśli nie skonfigurowanie dla --global
...
```

stworzony zostaje katalog `.git/`.


### Śledzenie zmian

```console
user@host:~$ echo "print('spam eggs')" > main.py
user@host:~$ git status #zwraca informacje o pliku main.py nie dodanym do indexu
user@host:~$ git add main.py #opcjonalnie . - dodaj cały katalog, -A/--all dodaj wszystko
user@host:~$ git status # informacja o śledzeniu pliku main.py i oczekiwaniu na commit
```

### Zatwierdzanie zmian (commit)

```console
user@host:~$ git commit -m "My first commit" #brak opcji -m otworzy edytor z $EDITOR
```

W celu podpisania kluczem GPG dodajemy opcje `-S`


### Dodatkowe polecenia

```console
user@host:~$ git log #pokaż historie zmian (w programie less)
user@host:~$ git tag #pokaż tagi
user@host:~$ git branch #pokaż lokalne gałęzie, opcja -a pokaże również zdalne
user@host:~$ git log --graph #pokaż graficzną reprezentację gałęzi
user@host:~$ git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all #jak wyżej ale dokładniej
```




### Historia zmian

```console
user@host:~$ git log # wersja kompaktowa z opcją --oneline
```

```
commit d6adaa1748733e8b1b89311dd9f306b26c0b5f6a (HEAD -> master)
Author: aszadzinski <albert.szadzinski@p.com>
Date:   Thu Oct 28 08:14:38 2021 +0200

    My 2 commit

commit cd75575462c6280252f5aa83ba74692f08b86f49
Author: aszadzinski <albert.szadzinski@p.com>
Date:   Thu Oct 28 08:14:18 2021 +0200

    My 1 commit
```

Każdy commit identyfikowany jest przez hash, w celu cofnięcia się do poprzedniego stanu należy użyć polecenia `checkout`

```console
user@host:~$ git checkout cd75575 #nie trzeba podawać pełnego identyfikatora
user@host:~$ git checkout master #powrót do wersji aktualnej (gałęzi master)
```

### Tagowanie

```console
user@host:~$ git tag v1.0
```

Każdy commit można tagować, dzięki czemu nie trzeba odwoływać się do zmian przez hash `$ git checkout v1.0` (tagi domyślnie są lokalne, [zobacz tagi globalne](#Wysyłanie-tagów)). 

### Pokaż różnice między commitami

```console
git diff <ID_COMMIT> #przydatne z --word-diff jeśli różnice istnieją w tej samej linii

```

### Dopisywanie i edycja commitów

Np. w celu dopisania zmian do istniejącego commita, zamiast tworzenie nowego można użyć:

```console
user@host:~$ git commit --amend #dodaje zmiany z indexu do ostatniego commita, można użyć z innymi opcjami np. -S. Jeżeli w międzyczasie wprowadziliśmy zmiany do kodu, wcześniej dodajemy je do indexu git add -A
```

Commit można również cofnąć z zachowanymi zmianami w sekcji index:

```console
user@host:~$ git reset --soft COMMIT_ID # wpisując HEAD^ cofa tylko ostatni commit
```

### Odzyskiwanie stanu pojedynczego pliku

```console
user@host:~$ git restore PLIK --source COMMIT/TAG/BRANCH # --source/-s
```

### Reset repozytorium

```console
user@host:~$ git reset --hard REPO/BRANCH...
```
**Uwaga** Dane dodane do indeksu przepadają

### gitignore

Chcemy, aby część plików w naszym katalogu roboczym nie była uwzględniana przy `git add`. Dotyczy to np. plików tymczasowych, cache, binarnych, plików wrażliwych typu hasła, tokeny API itp.

Aby to osiągnąć możemy dodać plik `.gitignore`, który wskaże które pliki mają być ignorowane podczas commitów. Przykładowa postać:

```console
user@host:~$ cat .gitignore
*.pyc #ignoruje wszystkie pliki z rozszerzeniem .pyc
api.txt #ignoruje plik api.txt
venv/ #ignoruje katalog venv
```

Uwaga: ignorowanie następuje po commicie z plikiem .gitignore, jeśli ignorowane pliki istnieją już w poprzednich commitach, zablokujemy jedynie ich aktualizację.



## Repozytoria zdalne

### Pobieranie z repozytorium zdalnego (klonowanie)

```console
user@host:~$ git clone LINK_do_Repo
```

Najczęściej używane

- protokół http, np. `$ git clone https://github.com/aszadzinski/SMCEBI-TLM.git`
- protokół SSH, np. `user@host:~$ git clone git@github.com:aszadzinski/SMCEBI-TLM.git`
- repozytorium "zdalne" istnieje lokalnie, np.: `user@host:~$ git clone <path>/SMCEBI.git`


### Tworzenie własnego repozytorium

Puste repozytorium zdalne można zainicjować ręcznie na np. GitHubie, jak również na np. własnym serwerze:

```console
user@host:~$ mkdir myRemoteRepo.git
user@host:~$ cd myRemoteRepo.git
user@host:~$ git init --bare
```

```console
user@host:~$ git clone ssh://login@adress:PORT/<path>/myRemoteRepo.git
```

### Linkowanie repozytorium lokalne-zdalne

W przypadku sklonowanego repozytorium automatycznie ustawiony zostaje alias **origin**, w innym przypadku należy ustawić je ręcznie:

```console
user@host:~$ git init #w katalogu istnieją już jakieś pliki, a repozytorium zdalne jest puste
user@host:~$ git remote -v #pokazuje linki do repozytoriów zdalnych (puste)
user@host:~$ git remote add remoteRepo https://github.com/aszadzinski/repo.git #dodanie adresu repozytorium pod nazwą `remoteRepo` #można dodać kilka
```

### Wysyłanie zmian do repozytorium zdalnego

W celu wysłania naszych zmian z repozytorium lokalnego do zdalnego, należy wykonać polecenie:

```console
user@host:~$ git add . 
user@host:~$ git commit -m "first commit" #przykładowa migawka
user@host:~$ git push ALIAS BRANCH
```

np.:

```console
user@host:~$ git push origin master
```

### Aktualizacja repozytorium lokalnego

W czasie, gdy modyfikujemy nasz kod lokalnie, na repozytorium zdalnym mogły pojawić się zmiany. Po wykonaniu polecenia `push`, git zwróci nam błąd o rozbieżnościach. Aby zaktualizować nasze repozytorium (commity, tagi) wykonujemy:

```console
user@host:~$ git pull origin master #ogólnie ... ALIAS BRANCH
```

W rzeczywistości jest to skrót. Git wykonuje dwa następujące po sobie polecenia `fetch` i `merge` (Szczegóły na następnych zajęciach przy pracy z gałęziami oprogramowania).

W tym wypadku mogą nastąpić 3 zdarzenia:

1. Łączenie wersji nie wywołuje, żadnego konfliktu. GIT dodaje nasze commity do gałęzi głównej, bez tworzenia commitu mergującego (FAST-FORWARD)
2. Modyfikacje dotyczą tego samego pliku np. w pliku *main.cpp* pojawiły się 2 funkcje pochodzące od różnych osób. Jeśli zmiany nie dotyczą tej samej linii, git samodzielnie łączy plik (recursive) i dodaje nowy commit np. "Merge branch from ...". Na tym etapie może wystąpić również problem z poleceniem `pull`. W takim wypadku należy najpierw wykonać polecenie `git fetch ALIAS` a następnie `git merge`. 
3. Git nie radzi sobie z połączeniem np. 2 osoby zmodyfikowały nazwę tej samej funkcji (git nie wie czyja wersja jest poprawna). W tym przypadku w pliku wywołującym konflikt pojawią się znaczniki:

```
def function1():
<<<<<<< HEAD
    print("abc123")
=======
    print("abcde")
>>>>>>> dev
```

Należy określić poprawną wersję a następnie zacommitować zmiany ręcznie.

### Wysyłanie tagów

Tagi są domyślnie lokalne, aby je wysłać na repozytorium zdalne należy wykonać polecenie:

```console
user@host:~$ git push ALIAS --tags
```



## Gałęzie

### Inicjalizacja nowej gałęzi

UWAGA: gałęzie tworzone są tylko lokalnie, aby umożliwić innym do nich dostęp należy wysłać je do repozytorium zdalnego.

```console
user@host:~$ git branch NAZWA_GALEZI # tworzy gałąź
user@host:~$ git checkout NAZWA_GALEZI # przełączanie
```

lub szybciej

```console
user@host:~$ git checkout -b NAZWA_GALEZI # stwórz i przełącz
```

### Wysyłanie zmian

gałąź staje się zdalna

```console
user@host:~$ git push ALIAS NAZWA_GALEZI
```

### Inne

```console
user@host:~$ git branch -a #pokaż aktualną gałąź oraz liste innych dostępnych
```

### Scalanie zmian

Mamy zmiany w gałęzi DEV, chcemy je scalić z kodem znajdującym się w gałęzi master:

```console
user@host:~$ git checkout master #przełączanie na gałąź master
user@host:~$ git merge DEV #scalanie zmian z dev do master (może powstać konflikt - naprawiamy i commitujemy zmiany z INDEXu)
user@host:~$ git push origin master #opcjonalnie wysyłamy na repo zdalne
```

---

## Warto doczytać

- `user@host:~$ git help core-tutorial`
- Inne narzędzia kontroli wersji oprogramowania: SVN, CVS, Mercurial, RCS...
- natywne wsparcie git przez IDE
- nakładki graficzne np **gitk**
- tworzenie własnego serwera z użyciem gitlab, cgit ...

---
