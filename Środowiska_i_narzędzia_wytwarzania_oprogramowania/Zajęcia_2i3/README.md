# Zajęcia 2 i 3

---

- [Podsumowanie](#Podsumowanie)
- [Warto doczytać](#Warto-doczytać)
- [Zadania](#Zadania)

---

## Podsumowanie

**Praca w gałęzi głównej**; podstawowe polecenia


#### Konfiguracja środowiska

```console
user@host:~$ git config PARAMS ARGS
```

**PARAMS** np.:

- `--global`, `--local` ustawienia globalne lub tylko dla danego repozytorium
- `user.name YOURNAME` nazwa użytkownika
- `user.email EMAIL`
- `user.signingkey ID` ID klucza GPG lub związany z nim e-mail
- `init.defaultBranch NAME` opcjonalna zmiana nazwy głównej gałęzi (zwykle main/master)

Dane powinny pokrywać się z tymi podanymi na hostingach np. GitHub

#### Inicjalizacja repozytorium lokalnego w folderze mylocalrepo/

```console
user@host:~$ cd mylocalrepo/
user@host:~$ git init
user@host:~$ git config --local user.name aszadzinski #jeśli nie skonfigurowanie dla --global
...
```

stworzony zostaje katalog `.git/`.


#### Śledzenie zmian

```console
user@host:~$ echo "print('spam eggs')" > main.py
user@host:~$ git status #zwraca informacje o pliku main.py nie dodanym do indexu
user@host:~$ git add main.py #opcjonalnie . - dodaj cały katalog, -A/--all dodaj wszystko
user@host:~$ git status # informacja o śledzeniu pliku main.py i oczekiwaniu na commit
```

#### Zatwierdzanie zmian (commit)

```console
user@host:~$ git commit -m "My first commit" #brak opcji -m otworzy edytor z $EDITOR
```

W celu podpisania kluczem GPG dodajemy opcje `-S`


#### Dodatkowe polecenia

```console
user@host:~$ git log #pokaż historie zmian (w programie less)
user@host:~$ git tag #pokaż tagi
user@host:~$ git branch #pokaż lokalne gałęzie
```

#### Historia zmian

```console
user@host:~$ git log
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

#### Tagowanie

```console
user@host:~$ git tag v1.0
```

Każdy commit można tagować, dzięki czemu nie trzeba odwoływać się do zmian przez hash `$ git checkout v1.0` (tagi domyślnie są lokalne).

#### Pokaż różnice między commitami

```console
git diff <ID_COMMIT> #przydatne z --word-diff jeśli różnice istnieją w tej samej linii

```

#### Dopisywanie/Edycja commitów

Np. w celu dopisania zmian do istniejącego commita, zamiast tworzenie nowego można użyć:

```console
user@host:~$ git add .
user@host:~$ git commit --amend #dodaje zmiany z indexu do ostatniego commita, można użyć z innymi opcjami np. -S
```

#### Odzyskiwanie stanu pojedynczego pliku

```console
user@host:~$ git restore PLIK --source COMMIT/TAG
```

#### Reset repozytorium

```console
user@host:~$ git reset --hard REPO/BRANCH...
```
**Uwaga** Dane dodane do indeksu przepadają




### Repozytoria zdalne

#### Pobieranie z repozytorium zdalnego (klonowanie)

```console
user@host:~$ git clone LINK
```

Najczęściej używane

- protokół http, np. `$ git clone https://github.com/aszadzinski/SMCEBI-TLM.git`
- protokół SSH, np. `user@host:~$ git clone git@github.com:aszadzinski/SMCEBI-TLM.git`
- repozytorium "zdalne" istnieje lokalnie, np.: `user@host:~$ git clone <path>/SMCEBI.git`


#### Tworzenie własnego repozytorium

Puste repozytorium zdalne można zainicjować ręcznie na np. GitHubie, jak również ręcznie na np. własnym serwerze:

```console
user@host:~$ mkdir myRemoteRepo.git
user@host:~$ cd myRemoteRepo.git
user@host:~$ git init --bare
```

```console
user@host:~$ git clone ssh://login@adress:PORT/<path>/myRemoteRepo.git
```


#### Linkowanie repozytorium lokalne-zdalne

W przypadku sklonowanego repozytorium automatycznie ustawiony zostaje alias **origin**, w innym przypadku należy ustawić je ręcznie:

```console
user@host:~$ git init #w katalogu istnieją już jakieś pliki, a repozytorium zdalne jest puste
user@host:~$ git add . && git commit -m "first commit" #przykładowe migawka
user@host:~$ git remote -v #pokazuje linki do repozytoriów zdalnych (puste)
user@host:~$ git remote add remoteRepo https://github.com/aszadzinski/repo.git #dodanie adresu repozytorium pod nazwą `remoteRepo` #można dodać kilka
```

#### Wysyłanie zmian do repozytorium zdalnego

W celu wysłania naszych zmian z repozytorium lokalnego do zdalnego, należy wykonać polecenie:

```console
user@host:~$ git push ALIAS BRANCH
```

np.:

```console
user@host:~$ git push origin master
```

#### Aktualizacja repozytorium lokalnego

W czasie, gdy modyfikujemy nasz kod lokalnie, na repozytorium zdalnym mogły pojawić się zmiany. Po wykonaniu polecenia `push`, git zwróci nam błąd o rozbieżnościach. Aby zaktualizować nasze repozytorium wykonujemy:

```console
user@host:~$ git pull origin master #ogólnie ... ALIAS BRANCH
```

W rzeczywistości jest to skrót. Git wykonuje dwa następujące po sobie polecenia `fetch` i `merge` (Szczegóły na następnych zajęciach przy pracy z gałęziami oprogramowania).

W tym wypadku mogą nastąpić 3 zdarzenia:

1. Łączenie wersji nie wywołuje, żadnego konfliktu. GIT dodaje nasze commity do gałęzi głównej, bez tworzenia commitu mergującego (FAST-FORWARD)
2. Modyfikacje dotyczą tego samego pliku np. w pliku main.cpp pojawiły się 2 funkcje pochodzące od różnych osób. Jeśli zmiany nie dotyczą tej samej linii, git samodzielnie łączy plik (recursive) i dodaje nowy commit np. "Merge branch ..."
3. Git nie radzi sobie z połączeniem np. 2 osoby zmodyfikowały nazwę konkretnej funkcji. W tym przypadku w pliku wywołującym konflikt pojawią się znaczniki:

```
def function1():
<<<<<<< HEAD
    print("abc123")
=======
    print("abcde")
>>>>>>> dev
```

Należy określić poprawną wersję a następnie zacommitować zmiany ręcznie.

#### gitignore

Chcemy, aby część plików w naszym katalogu roboczym nie była uwzględniana przy `git add`. Dotyczy to np. plików tymczasowych, cache, binarnych, plików wrażliwych typu hasła, klucze API...

Aby to osiągnąć możemy dodać plik `.gitignore`. Przykładowa postać:

```console
user@host:~$ cat .gitignore
*.pyc #ignoruje wszystkie pliki z rozszerzeniem .pyc
api.txt #ignoruje plik api.txt
venv/ #ignoruje katalog venv
```

Uwaga: ignorowanie następuje po commicie z plikiem .gitignore, jeśli ignorowane pliki istnieją już w poprzednich commitach, zablokujemy jedynie ich aktualizację.


#### Wysyłanie tagów

Tagi są domyślnie lokalne, aby je wysłać na repozytorium zdalne należy wykonać polecenie:

```console
user@host:~$ git push ALIAS --tags
```



### Gałęzie

#### Inicjalizacja nowej gałęzie

UWAGA: gałęzie tworzone są tylko lokalnie

```console
user@host:~$ git branch NAZWA_GALEZI # tworzy gałąź
user@host:~$ git checkout NAZWA_GALEZI # przełączanie
```

lub

```console
user@host:~$ git checkout -b NAZWA_GALEZI # stwórz i przełącz
```

#### Wysyłanie zmian

gałąź staje się zdalna

```console
user@host:~$ git push ALIAS NAZWA_GALEZI
```

#### Inne

```console
user@host:~$ git branch #pokaż Gałęzie
```

#### Scalanie zmian

Mamy zmiany w gałęzi DEV, chcemy je scalić z kodem znajdującym się w gałęzi master:

```console
user@host:~$ git checkout master #przełączanie na gałąź master
user@host:~$ git merge DEV #scalanie zmian (może powstać konflikt - naprawiamy i commitujemy zmiany z INDEXu)
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

## Zadania

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
