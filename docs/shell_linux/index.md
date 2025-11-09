# Shell Linux

## Co to je?

- Předmět zaměřený na základy práce v prostředí operačního systému Linux, s důrazem na ovládání pomocí příkazové řádky (shellu). Studenti se seznámí s principy práce v příkazové řádce operačního systému unixového typu.

## Co se naučíš?

- Orientace v systému: Práce s adresářovým stromem, práva souborů, uživatelé, správa procesů.
- Příkazová řádka: Použití základních příkazů pro navigaci a manipulaci se soubory.
- Shell scripting: Základy programování v shellu (bash).
- Textové nástroje: Zpracování textu pomocí regulárních výrazů a textových proudů.
- Výstupy z učení
- Absolvent předmětu by měl zvládnout orientaci v základním uživatelském prostředí každého systému typu UNIX/Linux.

## Přehled výuky

<iframe src="https://elearning.tul.cz/course/view.php?id=19038" width="100%" height="800px"></iframe>
- [Přehled na Elearning](https://elearning.tul.cz/course/view.php?id=19038)

## Přihlášení

- ssh perun.nti.tul.cz

### Prikazy z prvni hodiny cviceni

```bash
Ssh perun.nti.tul.cz
who
Yes
Heslo je sh
Passwd MUJJack3
Whoami
Ls
Ls -a
Ls -la
Pwd
Ls /
Ls /home/
Cd
Cd ..
Cd (bez ničeho nebo s tildou)
Mkdir adresar
Rmdir (prázdné adresáře)
Rm -r
Rm -r *
Rm -rf (smaže všechno takže systém) / sudo rm -rf
Cp -r (co a kam)
Mv
Touch
Rm s*
Man ls, cd… (maual)
Cp /home/jana/basnicky/m* .
Mkdir poezie
Mv m*.txt poezie
----------------
Absolutní cesta začíná vždy v /
Relativní cesta začíná vždy v aktuálním wd (working directory)
```

### Skripty

- Externí shell a skripty: [http://shell.nti.tul.cz/](http://shell.nti.tul.cz/)

### Procesy

- top ps ps aux ps ux
- sleep
- ; - příkaz do popředí
- & - spustí příkaz na pozadí
- fg1 z pozadi do popředí bg1 do pozadi
- ctrl + Z - do stopped
- kill PID - ukončen killall SIGTERM SIGKILL
