### ŚiNWO: Kolokwium poprawkowe 28.01.22 9:45-11:15

- 1ptk, Akceptuj zaproszenie do repozytorium [kolokwium-sinwo](https://github.com/aszadzinski/kolokwium-sinwo) (wysłane o 9:45).
- 1ptk, Sklonuj kolokwium-sinwo na INF-VM. Stwórz i przełącz się na gałąź *kolokwium-TWOJLOGIN*.
- 2ptk, Stwórz i uzupełnij plik **setup.py** (moduł Kolokwium, entry_points={'console_scripts':['kolokwium=Kolokwium:main']}), zatwierdź i wypchnij zmiany.
- 1ptk, Zainstaluj plik w wirtualnym środowisku (wyklucz je przez .gitignore), zatwierdź i wypchnij zmiany.
- 1ptk, Uzupełnij requirements.txt. Uruchom program przez `kolokwium --help` (w wirtualnym środowisku), zatwierdź i wyślij zmiany.
- 3ptk, Stwórz plik Dockerfile uruchamiający program przez `kolokwium --run` i ignorujący próby uruchomienia z dodatkowymi parametrami np `docker run -it OBRAZ --test` (Ma działać tylko dla braku opcji `docker run -it OBRAZ` lub dla pełnego polecenia np. `docker run OBRAZ kolokwium --test`).
- 1ptk, Zatwierdź zmiany w repozytorium (podpisz kluczem gpg).
- 1ptk, Stwórz registry o nazwie kolokwium-TWOJLOGIN na docker hubie (dane logowania w /etc/production).
- 2ptk, Zbuduj i wyślij obraz do registry  pod odpowiednią nazwą.
- 5ptk, Stwórz plik docker-compose.yml (dodaj sieć *TWOJLOGIN-net* i wolumen **TWOJLOGIN-vol** podpięty pod katalog /root/x, spraw aby tworzył się kontener o nazwie *kolokwium-TWOJLOGIN*), uruchom program przez docker-compose w tle.
- 1ptk, Zatwierdź i wyślij zmiany do repo, wykonaj pull request.
- 1ptk, Na własnym koncie GitHub stwórz publiczne puste repo **kp-TWOJLOGIN**.
- 1ptk, Dodaj nowy alias w wcześniej modyfikowanym lokalnym repozytorium do nowego zdalnego repozytorium kp-TWOJLOGIN.
- 1ptk, Wykonaj lokalny merge do gałęzi głównej i wypchnij ją do nowego repozytorium.
- 1ptk, Otaguj ostatni commit jako **v1.0** (wyślij do swojego repozytorium).
- 3ptk, Wygeneruj dokumentację i ustaw GitHub-pages, by pliki .html wyświetlały się po wejściu na stronę. Zatwierdz zmiany i wypchnij.
- 2ptk, Ustaw GitHub-action próbujący wywołać polecenie `kolokwium --test` po nowym wypchnięciu kodu do gałęzi głownej. Przetestuj działanie dodając plik z licencją MIT. 
- 2ptk, W lokalnym repo stwórz i wypchnij plik Makefile. Po wpisaniu polecenia `make clear` powinny zostać usunięte wszystkie niepotrzebne pliki (pycache,  dist, venv itp.).


### Ocena
- 16-18ptk: dst
- 19-21: dst+
- 22-24: db
- 25-27: db+
- 28-30: bdb

