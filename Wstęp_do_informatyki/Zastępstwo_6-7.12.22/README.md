# Język C - wstęp

## warto zobaczyć:

- [Raspberry Pi 3,4,W](https://botland.com.pl/399-raspberry-pi) - Jednopłytowe minikomputery ARM
- [Raspberry Pico](https://botland.com.pl/1262-raspberry-pi-pico) - płytka prototypowa z mikrokontrolerem *rp2040* od RaspberryPi, można programować w C/C++ lub Micro Pythonie.
- [Termux](https://termux.dev/en/) - Emulator środowiska Linux na Androida (*Nie* wymaga roota). Możliwość instalacji programów przez APT (pkg install XXX).
- [SSH-SecureShell]() - protokół komunikacyjny używany do bezpiecznego łączenia się z terminalem zdalnego komputera. Użycie `ssh nazwa_uzytkownika@adress`, Gdy port jest inny niż domyślny (22) można użyć z opcją `-p PORT`
- Proste wyjaśnienie zasady działania bramek logicznych [Link](https://www.youtube.com/watch?v=QZwneRb-zqA) i pamięci flash [Link](https://www.youtube.com/watch?v=I0-izyq6q5s)
- [Art of Code](https://www.youtube.com/watch?v=6avJHaC3C2U)

## Kompilacja

Proces kompilacji można podzielić na 4 części:

1. Preprocessing
2. Kompilacja właściwa
3. Asembleryzacja
4. Linkowanie

Załóżmy, że mamy 3 pliki: main.c, func.c oraz nagłówkowy func.h o zawartości:

```C
// Plik main.c
#include <stdio.h> //standardowa biblioteka wejścia-wyjścia, zawiera m.in. funkcje printf(), scanf()
#include "func.h" //napisany przez nas nagłówek z funkcją f(x,y)

int main() //obowiązkowa główna funkcja wykonująca się zawsze jako pierwsza
{
		// deklaracja zmiennej "a" o typie liczby całkowitej z jednoczesnym przypisaniem wartości
		int a=1;

		// deklaracja "b" bez przypisania wartości. 
		// Uwaga, w odróżnieniu od języków dynamicznych np. Python, 
		// zmienne muszą być zadeklarowane przed ich użyciem tzn. nie można 
		// umieścić w kodzie linii b=4; bez wcześniejszego int b;
		double b,c;

		// Wypisanie wartości zmiennej "a" na ekran. "%d" dla typu int, "%c" dla char, "%f" dla double itd.
		printf("a = %d \n", a);

		// 
		printf("Podaj pierwsza liczbe:")
		scan("%f", &b); //wczytuje 'b' podane przez użytkownika
		printf("Podaj druga liczbę:")
		scan("%f", &c);

		// wywołanie funkcji f znajdującej się w func.c
		printf("Wynik %f+%f to %f\n", b, c, f(b, c));

		// zwrócenie (dowolnej) wartości przez funkcję główną == zakończenie działania programu
		return 0;
}
```

```C
// Plik func.h

int f(double x, double y): //ciało funkcji nie jest wymagane w pliku nagłówkowym (zawartość w func.c)

```

```C
// Plik func.c

// funkcja zwracająca sumę dwóch liczb zmiennoprzecinkowych,
// zwracany typ to int dlatego nastąpi zaokrąglenie w dół
int f(double x, double y) 
{
		return x+y;
}
```

### Preprocessing

Zakła

## 
