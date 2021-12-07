# Zajęcia 1

---

- [Podsumowanie](#Podsumowanie)
- [Warto doczytać](#Warto-doczytać)
- [Zadania](#Zadania)

---

## Podsumowanie

**Najważniejsze polecenia** [LINK](https://kinsta.com/blog/linux-commands/)

#### [SSH](https://en.wikipedia.org/wiki/Secure_Shell)

połączenie z komputerem `<adres_hosta>` jako użytkownik `<nazwa-użytkownika>`


```console
user@host:~$ ssh nazwa-użytkownika@adres-hosta -p PORT

```

generowanie kluczy ssh:


```console
user@host:~$ ssh-keygen -b ILE_BITOW

```

zapisane w `~/.ssh/id_rsa*`


#### Wejście do katalogu


```console
user@host:~$ cd KATALOG

```

skróty: `.` aktualny katalog, `~` katalog domowy, `..` katalog wyżej

#### Aktualna ścieżka


```console
user@host:~$ pwd

```

#### Pokaż pliki


```console
user@host:~$ ls

```

Najczęstsze argumenty: `-l` szczegóły, `-a` pokaż ukryte katalogi

#### Nowy katalog


```console
user@host:~$ mkdir NAZWA_KATALOGU

```

#### Kopiuj, przenieś, usuń


```console
user@host:~$ cp CO GDZIE

```


```console
user@host:~$ mv CO GDZIE

```


```console
user@host:~$ rm PLIK_DO_USUNIĘCIA

```

Najczęstsze argumenty: `-r` rekursywnie, `-f` wymuś

#### Pokaż dokumentacje


```console
user@host:~$ man POLECENIE
```

#### Szukaj


```console
user@host:~$ find GDZIE -parametr "WYRAŻENIE"
```

`-parametr`: np. `-name` nazwa pliku, `-iname` ignoruj wielkość liter itp.

#### Zmiana uprawnień


```console
user@host:~$ chmod WŁAŚCICIEL|GRUPA|INNI PLIK
```

np. `user@host:~$ chmod 764 plik.txt`

`1`- wykonanie, `2` odczyt, `4` zapis

zmiana właściciela:


```console
user@host:~$ chown KTO PLIK
```

zmiana grupy:


```console
user@host:~$ chgrp GRUPA PLIK
```

#### Przykładowe edytory tekstu


```console
user@host:~$ nano
user@host:~$ vim #jak wyjść z vim'a: ESC :q!
```

#### Pokaż zawartość pliku


```console
user@host:~$ cat PLIK
user@host:~$ less PLIK
```

#### Strumienie

np. poszukaj "wyrażenie" w pliku file.txt


```console
user@host:~$ cat file.txt  | grep "wyrażenie"
```

#### [Przekierowania](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean#)


```console
user@host:~$ ls > plik.txt
```

wyjście polecenia `ls` zapisane w `plik.txt`. `>` nadpisz, `>>` dopisz

`1>` stdout, `2>` stderr

#### Uruchamianie plikow wykonywalnych


```console
./plik
```

lub


```console
/ścieżka/plik
```


### Kryptografia asymetryczna

[RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)#Operation), [klucze publiczne, prywatne](https://protonmail.com/blog/what-is-pgp-encryption/)

#### Pokaż klucze publiczne


```console
user@host:~$ gpg --list-keys
```

#### Pokaż klucze publiczne


```console
user@host:~$ gpg --list-secret-keys
```

#### Wygeneruj klucze


```console
user@host:~$ gpg --full-generate-key
```

#### Wyeksportuj do pliku ASCII (klucze prywatne --export-secret-keys)


```console
user@host:~$ gpg --export --armor ID_LUB_MAIL >> plik.asc
```

---


## Warto doczytać

- [Emulator Linux'a na Androida](https://termux.com/)
- [Windows subsystem for Linux](https://www.windowscentral.com/how-install-wsl2-windows-10)
- [VirtualBox](https://www.virtualbox.org/)
- [Multiplexer terminala - TMUX](https://linuxize.com/post/getting-started-with-tmux/)
- Manager plików CLI - [ranger](https://github.com/ranger/ranger), [mc](https://www.linuxcommand.org/lc3_adv_mc.php)
- Powłoki systemu np.: [console](https://pl.m.wikipedia.org/wiki/Bash)(domyślna dla większości dystrybucji systemów Linux), [zsh](https://en.m.wikipedia.org/wiki/Z_shell) i jej plugin [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

---

## Zadania

1. Załóż konto na [githubie](https://github.com/signup) *0ptk*
	- dodaj wygenerowane klucze GPG i SSH w ustawieniach swojego konta
	- dodaj gwiazdkę lub wyślij swoj nick mailowo

![git_star](../.pictures/git_star.png)


2. **dla chętnych**
	- naucz się obslugi managerów plików CLI np. ranger, mc. 
	- jak uruchomić okienkowy edytor plików mając dostęp do serwera tylko po SSH.

---
