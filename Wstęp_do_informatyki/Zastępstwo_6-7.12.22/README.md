# Język C - wstęp

## warto zobaczyć:

- [Raspberry Pi 3,4,W](https://botland.com.pl/399-raspberry-pi) - Jednopłytowe minikomputery ARM
- [Raspberry Pico](https://botland.com.pl/1262-raspberry-pi-pico) - płytka prototypowa z mikrokontrolerem *rp2040* od RaspberryPi, można programować w C/C++ lub Micro Pythonie.
- [Termux](https://termux.dev/en/) - Emulator środowiska Linux na Androida (*Nie* wymaga roota). Możliwość instalacji programów przez APT (pkg install XXX).
- [SSH-SecureShell]() - protokół komunikacyjny używany do bezpiecznego łączenia się z terminalem zdalnego komputera. Użycie `ssh nazwa_uzytkownika@adress`, Gdy port jest inny niż domyślny (22) można użyć z opcją `-p PORT`

## Kompilacja

Proces kompilacji można podzielić na 4 części:

1. Preprocessing
2. Kompilacja właściwa
3. Asembleryzacja
4. Linkowanie

