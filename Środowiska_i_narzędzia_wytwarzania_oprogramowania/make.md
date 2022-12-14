# Makefile

---

- [Kompilacja](#Kompilacja)
  - [Preprocessor](#Preprocessing)
  - [Tworzenie kodu assemblera](#Kompilacja-właściwa)
  - [Tworzenie plików obiektowych](#Assembler)
  - [Linker](#Linker)
- [Make](#Make)



---

### Kompilacja

Stwórzmy proste drzewo projektu:

```
projekt
├── bin
├── include
│   └── test.hpp
├── main.cpp
└── src
    └── test.cpp
```

W katalogu `include/` przechowujemy pliki nagłówkowe `.h/.hpp`, w `src/` ich źródła `.c/.cpp`. `main.cpp` zawiera funkcję główną `int main()`.

```c++
// Plik main.cpp
#include <stdio.h> // biblioteka standardowa IO
#include "test.hpp" // nagłówek z funkcją myfunc

int main()
{
		int a=10;
		printf("Funkcja main: a=%d\n",a); // wypisz wartość a

		printf("a+b=%d\n", myfunc(3,4)); // wypisz wynik działania funkcji myfunc
		return 0;
}
```

```c++
// Plik include/test.cpp
int myfunc(int x, int y);
```

```c++
// Plik src/test.cpp
#include <stdio.h>

int myfunc(int x, int y)
{
		printf("Funkcja myfunc(%d, %d)\n", x, y);
		return x+y;
}
```

Komentując linie `#include <test.hpp>` oraz `printf("a+b=%d\n", myfunc(3,4));` w pliku `main.cpp` program kompilujemy poleceniem:

```console
user@host:~$ g++ main.cpp -o bin/myprogram # brak opcji -o stworzy plik wykonywalny a.out
user@host:~$ bin/myprogram
> Funkcja main: a=10
```

Chcąc użyć nagłówka `test.hpp` i zawartej funkcji `myfunc` (po odkomentowaniu) musimy dodać flagę `-I` wskazującą lokalizację plików nagłówkowych dla preprocessora oraz lokalizację kodu źródłowego: 


```console
user@host:~$ g++ main.cpp src/test.cpp -o bin/myprogram -I include/
user@host:~$ bin/myprogram
> Funkcja main: a=10
> Funkcja myfunc(3, 4)
> a+b=7
```

Inne przydatne flagi dla kompilera:

- `-W`: Ostrzeżenia np. `-Wall`, `Werror`, `-Wpedantic`
- `-std`: standard C/C++ np. `-std=c++17`
- `-g`: więcej informacji dla debuggera, używane z `-Og`
- `-O`: Stopień optymalizacji kodu np. `-O2`

---

Proces kompilacji można podzielić na 4 główne kroki:

- Preprocessing
- Kompilacja właściwa
- Generowanie plikow obiektowych
- Linkowanie

#### Preprocessing

Zatrzymanie kompilatora na etapie preprocessingu odbywa się z opcją `-E`:

```console
user@host:~$ g++ -E main.cpp -I include/ 
```

Na tym etapie kod źródłowy jest przetwarzany na potrzeby późniejszej kompilacji. Usuwane są komentarze, dołączane pliki nagłówkowe oraz sprawdzana jest analiza składniowa. Preprocessor rozpoznaje [dyrektywy](https://cpp-polska.pl/post/teoria-kompilacji-preprocessing) pozwalające modyfikować bezpośrednio kod źródłowy (makra preprocessora i pseudostałe).

#### Kompilacja właściwa

Zatrzymanie kompilatora na tym etapie odbywa się z użyciem opcji `-S`. 

```console
user@host:~$ g++ -s main.cpp -I include/  # utworzony zostanie plik main.s
```

```assembly
; PLIK main.s 
	.file	"test.cpp"
	.text
	.section	.rodata
.LC0:
	.string	"Funkcja myfunc(%d, %d)\n"
	.text
	.globl	_Z6myfuncii
	.type	_Z6myfuncii, @function
_Z6myfuncii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z6myfuncii, .-_Z6myfuncii
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
```

Kod zostaje przetłumaczony na język assemblera.


#### Assembler

Kolejnym krokiem jest przetworzenie kodu assemblera na kod maszynowy. Tworzone zostają pliki obiektowe zbliżone wyglądem do plików wykonywalnych. Zatrzymanie procesora na tym etapie jest możliwe używając opcji `-c`

```console
user@host:~$ g++ -c main.cpp -o bin/myprogram -I include/  # utworzony zostanie plik main.o
```

#### Linkowanie

Dla każdego pliku źródłowego tworzony jest odrębny plik obiektowy, następnie wszystkie łączone są przez Linker do pliku wykonywalnego. 

```console
user@host:~$ g++ -c main.cpp -I include/	# utworzony zostanie plik main.o
user@host:~$ g++ -c src/test.cpp			# utworzony zostanie plik test.o
user@host:~$ g++ main.o test.o -o bin/myprogram # tworzy plik wykonywalny
```

Efektem procesu kompilacji mogą być:

- pliki wykonywalne/obiektowe
- biblioteki statyczne i dynamiczne

### Make

Make jest programem do automatyzacji kompilacji i budowania projektu. Działanie polega na interpretowaniu plików `Makefile` zawierających wprowadzone przez użytkownika (lub automatycznie: CMAKE) instrukcje  i reguły. Najczęściej używany w programach napisanych w językach C/C++, ale również Pythonie czy X

Prosty plik może wyglądać następująco:

```Makefile
main:
		g++ main.cpp src/test.cpp -Iinclude -o bin/myprogram -Wall
clean:
		rm bin/myprogram
say:
		echo "Halo"
```

```console
# Brak sprecyzowania konkretnej reguły wywoła pierwszą w tym przypadku "make"="make main"
user@host:~$ make		# kompiluje program zgodnie z instrukcją
user@host:~$ make clean	# usuwa plik wykonywalny
```

Reguły można mieszać (polecenie `make` wywoła najpierw `say` potem skompiluje program): 

```Make
main: say
		g++ main.cpp src/test.cpp -Iinclude -o bin/myprogram -Wall
...
```

#### Wartości domyślne

```Makefile

TEST?="TEST"

say:
		@echo "Halo ${TEST}"
# symbol @ blokuje wyświetlanie treści polecenia
```

`make say` zwróci "Halo TEST", podmiana możliwa jest z linii poleceń np. `make say TEST=ZMIANA` lub przez zmienną środowiskową:

```console
user@host:~$ export TEST=ZMIANA
user@host:~$ make say
Halo ZMIANA
```












