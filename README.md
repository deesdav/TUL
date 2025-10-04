# TUL

Vítejte v repozitáři TUL!

## Přehled

Repozitář TUL slouží jako centrální úložiště zdrojů, kódu a dokumentace související s projektem TUL. Struktura je navržena pro přehlednost, spolupráci a rozšiřitelnost.

## Klíčové vlastnosti

- Organizovaná struktura složek a materiálů.
- Dokumentace pro snadné používání a sdílení.
- Kód připravený pro další rozvoj.

## Začínáme

1. Naklonujte repozitář:
   ```bash
   git clone https://github.com/deesdav/TUL.git
   ```
2. Přesuňte se do adresáře projektu:
   ```bash
   cd TUL
   ```

## Spuštění lokálního webu pomocí MkDocs (Material)

1. Aktualizujte pip a nainstalujte MkDocs + Material theme:
   ```powershell
   py -m pip install --upgrade pip
   py -m pip install mkdocs mkdocs-material
   ```
2. Ze složky repozitáře spusťte lokální server MkDocs:
   ```powershell
   py -m mkdocs serve
   ```
   Poznámka: někdy se místo příkazu `mkdocs serve` používá `py -m mkdocs serve`, pokud není složka Scripts v PATH.
3. Otevřete v prohlížeči:
   ```
   http://127.0.0.1:8000
   ```

## Přispívání

1. Forkněte repo.
2. Vytvořte nový branch pro změny.
3. Odešlete Pull Request s popisem změn.
