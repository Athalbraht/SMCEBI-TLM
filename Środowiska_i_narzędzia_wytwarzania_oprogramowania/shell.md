# Powłoka Linux/klucze GPG&RSA - przypomnienie

---

- [Warto doczytać](#Warto-doczytać)
- [Klicze SSH](#SSH)
- [Powłoka Linux](#Powłoka-Linux)
- [GPG](#GPG-Kryptografia)
		- [Kryptografia Asymetryczna](#Asymetryczne)
		- [Kryptografia Symetryczna](#Symetryczne)

---


### [SSH](https://en.wikipedia.org/wiki/Secure_Shell)

połączenie z komputerem `<adres_hosta>` jako użytkownik `<nazwa-użytkownika>`


```console
user@host:~$ ssh nazwa-użytkownika@adres-hosta -p PORT

```

#### Generowanie pary kluczy SSH (RSA):


```console
user@host:~$ ssh-keygen -b ILE_BITOW

```

domyślnie zapisane w `~/.ssh/id_rsa*`. Klucze można wykorzystać do bez-hasłowego logowania ssh:

```console
user@host:~$ ssh-copy-id USER@ADDRESS # komputer wysyła swój klucz publiczny, Następne logowanie po ssh nie wymaga hasła
```

Dodając swój klucz publiczny do konta GitHub (w ustawieniach konta) oraz wykonując `ssh-copy-id git@github.com`, Github nie zapyta nas o hasło przy wykonywaniu poleceń `git push` (o ile wykorzystujemy adresy zdalnego repo w formie ssh a nie https np. `git remote add origin git@github.com:aszadzinski/SMCEBI-TLM.git`).

### Powłoka Linux 

**Najważniejsze polecenia** [LINK](https://kinsta.com/blog/linux-commands/)

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
user@host:~$ man POLECENIE # lub POLECENIE --help/-h
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

`1`- wykonanie, `2` odczyt, `4` zapis. Oraz formy np. `chmod +x PLIK` (plik wykonywalny) 

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
user@host:~$ head -n10 PLIK #10 pierwszych linii
user@host:~$ tail -n10 PLIK #10 ostatnich linii
```

#### Strumienie


```console
user@host:~$ cat file.txt  | grep "wyrażenie"	# poszukaj "wyrażenie" w pliku file.txt
user@host:~$ head -n1000 file.txt  | less		# pokaż 1000 pierwszych linii w programie less 

```

#### [Przekierowania](https://stackoverflow.com/questions/818255/in-the-shell-what-does-21-mean#)


```console
user@host:~$ ls > plik.txt
```

wyjście polecenia `ls` zapisane w `plik.txt`. `>` nadpisz, `>>` dopisz

`1>` stdout, `2>` stderr, `&>` wszystko

#### Uruchamianie plikow wykonywalnych

```console
./plik
```

lub

```console
/ścieżka/plik
```

### GPG Kryptografia

[RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)#Operation), [klucze publiczne, prywatne](https://protonmail.com/blog/what-is-pgp-encryption/)

#### Wylicz hash pliku (funkcja skrótu)

Przydatne do weryfikacji integralności pliku oraz bezpieczeństwa.

```console
user@host:~$ md5sum PLIK > PLIK.md5 #md5
user@host:~$ sha256sum PLIK > PLIK.sha256 #sha256
```

#### Wygeneruj klucze

Wygenerowane klucze można dodać do konta GitHub i podpisywać cyfrowo commity `git commit -S -m "xxx"` (Commit widnieje na Githubie jako **Verified**). Wcześniej należy dodać [ID](#Pokaż-klucze-prywatne) klucza do  konfiguracji gita `git config user.signingkey ID_KLUCZA`

```console
user@host:~$ gpg --full-generate-key
```

#### Pokaż klucze publiczne 

```console
user@host:~$ gpg --list-keys
```

#### Pokaż klucze prywatne 

```console
user@host:~$ gpg --list-secret-keys
```

#### Wyeksportuj do pliku ASCII (klucze prywatne --export-secret-keys)

```console
user@host:~$ gpg --export --armor ID_LUB_MAIL >> plik.asc # bez --armor plik nie będzie w ASCII
```

### Szyfrowanie pliku 

#### Asymetryczne

 - Szyfrowanie pliku kluczem publicznym. Klucz publiczny innej osoby można dodać do bazy poleceniem `gpg --import KLUCZ`

```console
user@host:~$ gpg -e PLIK # --armor zapisze w ASCII, opcjonalnie -r ID_KLUCZA_PUBLICZNEGO
```

- Weryfikacja podpisu:

Nastąpi automatycznie przy deszyfracji. Jeżeli posiadamy tylko podpisany plik (wygenerowany bez szyfrowania `gpg --sign PLIK`) to weryfikujemy przez:

```console
user@host:~$ gpg -d PLIK.gpg #PLIK.asc jeśli tworzony z --armor
```

- Odszyfrowanie:

```console
user@host:~$ gpg -d PLIK.gpg #PLIK.asc jeśli tworzony z --armor
```

#### Symetryczne

Program GPG można wykorzystać do szyfrowania symetrycznego np. AES

```console
user@host:~$ gpg --symmetric --cipher-algo AES256 aa.txt # deszyfrowanie jak asymetrycznie
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
