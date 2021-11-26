# Zajęcia 1

---

- [Podsumowanie](#Podsumowanie)
- [Zadania](#Zadania)

---

## Podsumowanie

### git: rebase

Chcąc wdrożyć zmiany z gałęzi dev do master wykonuje się:

```bash
$: git checkout master # przełącz na master
$: git merge dev # wdróż zmiany z dev do master
```

Aby zachować liniowość jak z rysunku poniżej należy użyć polecenia `rebase`:

```bash
$: git checkout dev # przełącz na gałąź dev
$: git merge master # wdraża zmiany z master do dev, może pojawić się dodatkowy commit mergujący
$: git rebase master # przebudowuje historie
$: git checkout master
$: git merge dev
```

![rebase_merge](../.pictures/rebase_merge.png)


### Jak naprawić niezagnieżdżone gałęzie (Zajęcia 4: Zadanie)

![rebase_fix](../.pictures/merge_fix.png)

Dla gałęzi main mamy:

```
da68a0e 3 commit tag: v1.2
6a23fd9 2 commit tag: v1.1
86252d8 1 commit tag: v1.0
```

natomiast dla gałęzi dev np.:

```
ee20b33 2 dev commit tag: v1.0.1b
68fa87f 1 dev commit tag: v1.0.2b
```

brak wspólnego commitu wywoła błąd przy próbie wykonania polecenia `git merge dev`:

`fatal: refusing to merge unrelated histories`

W celu naprawy wykonujemy:

```bash
$: git checkout dev # przełącz na dev
$: git merge v1.0 --allow-unrelated-histories # wstawia brakujący commit gałęzi main
$: git push origin --force dev # opcja --force nadpisuje wadliwą gałąź w repozytorium zdalnym (należy używać ostrożnie, szczególnie w gałęźi głównej)
```
---


### Docker: attach i exec

### Docker: Volumeny

### Docker: Sieci

### Docker: Zmienne środowiskowe

### Docker: Współdzielenie zasobów

### Docker: Dodatkowe parametry polecenia `run`


## Zadania



---
