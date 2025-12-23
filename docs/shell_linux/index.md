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

## Témata ke zkoušce

### 1. Typy souborů v Linuxu

Specifikace: První znak ve výpisu **ls -l**.

**-** Obyčejný soubor: Text, binárka, obrázek.

**d** Adresář: Soubor obsahující seznam inodů a jmen.

**l** Symbolický odkaz: Cesta k jinému souboru.

**b** Blokové zařízení: Disk, CD-ROM (přenáší data po blocích/bufferech).

**c** Znakové zařízení: Terminál, klávesnice, /dev/null (přenáší po znacích).

**p** Pojmenovaná roura (FIFO): Pro komunikaci procesů.

**s** Socket: Pro komunikaci (i síťovou).

**Hard Link vs. Soft Link**:

**Hard link** (Pevný): Stejný inode, stejná data. Smazání originálu data nezničí (pokud existuje link). Omezení: Musí být na stejném disku (partition) a nelze na adresář.

**Soft link** (Symbolický): Jen textový soubor s cestou ("zástupce"). Má vlastní inode. Smazání originálu = nefunkční odkaz (broken link).

![hard_link_vs_soft_link](hard_link_vs_soft_link.png)

### 2. Adresářový strom

Kořen: **/** (Root). Stromová struktura (bez cyklů). Signifikantní adresáře:

**/bin, /sbin, /usr/bin**: Spustitelné programy.

**/etc**: Konfigurace (textové, čitelné).

**/home**: Data uživatelů.

**/proc**: Virtuální FS (info o procesech v RAM).

**/dev**: Soubory zařízení (/dev/null = černá díra, /dev/zero = generátor nul).

**/var**: Logy, proměnná data.

**/tmp**: Dočasné soubory.

### 3. Cesty adresářovým stromem

**Absolutní**: Začíná **/**. Neměnná. Bezpečná do skriptů.

**Relativní**: Nezačíná **/**. Vztahuje se k PWD. Používá **.** (aktuální) a **..** (nadřazený).

### 4. Filesystem, metadata, inode

Filesystem: Způsob organizace dat na fyzickém disku (formátování).

Příklady: ext4, xfs, btrfs.

Metadata: Data o datech (vlastník, oprávnění, čas změny, velikost). Neobsahují jméno souboru ani samotný obsah.

Inode: Datová struktura (číslo). Obsahuje metadata: Vlastník, práva, časy (změna, přístup), velikost, pozice dat na disku. NEobsahuje jméno souboru (to je v adresáři). Práva (chmod):

**r**=4, **w**=2, **x**=1.

Speciální bity:

SUID (**s** u vlastníka): Spouští se s právy vlastníka souboru (ne toho, kdo ho spustil).

\*SGID (**s** u skupiny): Dědí skupinu adresáře.

Sticky bit (**t**): V **/tmp** – mazat může jen vlastník, i když mají zápis všichni.

Příklad: chmod 755 soubor znamená:

Vlastník (7 = 4+2+1): Čte, píše, spouští.

Skupina (5 = 4+0+1): Čte, spouští.

Ostatní (5 = 4+0+1): Čte, spouští.

Umask: Výchozí nastavení práv pro nově vytvořené soubory (odečítá se od základu).

### 5. Uživatelé

**Root** (UID 0): Správce, může vše, **Systémoví uživatelé** (nízká UID): Pro běh služeb (www-data, mail), nemají login shell, **Běžní uživatelé** (UID 1000+): Omezená práva.

Soubory:

**/etc/passwd**: Login, UID, GID, home, shell. (Hesla tu nejsou, je tu x).

**/etc/shadow**: Zašifrovaná hesla, expirace hesel (čte jen root).
Typy:

### 6. Skupiny (Grupy)

Definice: V souboru **/etc/group**. Slouží ke sdílení práv mezi více uživateli.

Princip: Uživatel má jednu primární skupinu (v passwd) a může být v mnoha sekundárních. Příkaz **chgrp** mění skupinu souboru.

### 7. Stavy procesu

Stavy:

**R** (Running): Běží.

**S** (Sleeping): Čeká (na disk, klávesnici).

**T** (Stopped): Pozastaven (např. přes CTRL+Z).

**Z** (Zombie): Mrtvý, rodič si nepřečetl exit status.

Signály (kill):

**SIGINT** (Ctrl+C): Ukonči se slušně (exit code 130).

**SIGTSTP** (Ctrl+Z): Pozastav se (Stopped).

**SIGTERM** (kill PID): Ukonči se (default).

**SIGKILL** (kill -9 PID): Okamžitá vražda (nejde ignorovat).

![Životní cyklus procesu (Zombie)](zivotni_cyklus_procesu.png)

### 8. Monitorování procesů

**Interaktivní**: top, htop (vidím vytížení, neustále se aktualizuje, q pro konec).

**Neinteraktivní**: ps (výpis aktuálního stavu). Časté: ps aux nebo ps -ef.

**V terminálu**: jobs (úlohy na pozadí), bg (hodit na pozadí), fg (vrátit do popředí).

### 9. Závislosti mezi procesy

**Rodič** (Parent) -> Potomek (Child). Potomek dědí proměnné označené **export**.

**Zombie**: Nejde zabít (je mrtvý). Musíš zabít jeho rodiče -> Zombie adoptuje **init** (PID 1) a ten ho uklidí.

### 10. Spuštění příkazu

Jak shell pozná příkaz:

Je to absolutní/relativní cesta? (**./skript.sh**) -> Spustí to.

Je to alias (zkratka v **.bashrc**) nebo funkce (definovaná ve skriptu)? -> Spustí to.

Je to interní příkaz (built-in)? (**cd**, **echo**, **let**) -> Provede ho přímo shell.

Je to externí program? -> Hledá ho v adresářích uvedených v proměnné **$PATH**.

### 11. Textové Proudy a Roury

**Proudy**:

**stdin** (0): Vstup (klávesnice).

**stdout** (1): Výstup (obrazovka).

**stderr** (2): Chybový výstup (obrazovka).

Přesměrování:

**>** (přepsat)

**>>** (připojit)

**2>** (přesměrovat chyby)

**2> /dev/null** (zahodit chyby)

**<** (číst ze souboru)

**&>** (přesměrovat vše).

Roura |: Výstup prvního je vstupem druhého.

![roura](roura.png)

Příklad: cat soubor.txt | grep "slovo" (Vyhledá slovo v obsahu souboru).

### 12. Skripty v bashi

Co to je: Textový soubor s příkazy.

Vlastnosti:

**Spuštění**: **./skript.sh** (musí mít právo spustitelnosti **chmod +x** soubor).

**Hlavička (Shebang)**: #!/bin/bash na prvním řádku (určuje interpret).

**Vstup**: Příkaz read proměnná (načte vstup od uživatele).

**Použití**: Automatizace opakovaných úloh.

### 13. Proměnné v bashi

**Typ**: Vše je řetězec (string).

**Naplnění**: JMENO=hodnota (bez mezer!).

**Volání**: $JMENO nebo ${JMENO}.

**Argumenty**: $0 - jméno skriptu, $1 - první parametr, $# - počet parametrů.

**Úpravy řetězců (z materiálů)**:

**Výřez**: promenna:odkud:kolik - např. ${cislo:2:3}

**Vlastní vs. Systémové**:

**Vlastní**: pocet=5 (platí jen v aktuálním shellu, pokud nedám export).

**Systémové**: $USER (uživatel), $HOME (domov), $PATH (cesty), $PWD (kde jsem).

### 14. Podmínky v bashi

**Exit status**: Návratová hodnota posledního příkazu ($?). **0** = OK, **1-255** = Chyba.

**Testování [ ... ]**:

**-e** (existuje), **-f** (soubor), **-d** (adresář).

**-z** (prázdný string), **-n** (neprázdný).

**-eq** (rovná se číslo), **==** (rovná se text).

**Podmíněný příkaz**: **&&** (spusť další, jen když první prošel), **||** (spusť další, když první selhal).

**if**:

```bash
if [ "$a" -eq 1 ]; then
echo "Je to jedna"
fi

case "$promenna" in
  start) echo "Spouštím";;
  *) echo "Neznám";;
esac
```

### 15. Cykly v bashi

**While**: Dokud je podmínka pravda (while [ $i -lt 5 ]).

**Until**: Dokud podmínka NENÍ pravda (opak while).

**For**: for i in {1..10}; do ... done.

**Řízení**: break (vyskoč ven), continue (přeskoč zbytek a jdi na další kolo).

**Nekonečný cyklus**: while true; do ... done.

```bash
for (( i=1; i<=9; i++ ))
do
    for (( j=1; j <=i; j++ ))
        do
            echo -n "$i"
        done
        echo ""
done
```

### 16. Soubory k nastavení bashe

**~/.bashrc**: Pro interaktivní shell (aliasy, prompt).

**/etc/profile**: Pro celý systém.

**Proměnné prostředí**: env (výpis), export (zveřejnění pro potomky).

### 17. Terminál a shell

Terminál: Okno/HW, které zobrazuje znaky a posílá vstupy (např. Putty, xterm).

Shell: Program běžící na serveru, interpretuje příkazy (např. bash, sh, zsh).

Druhy: sh, bash, zsh, csh, fish. Seznam dostupných je v /etc/shells.

### 18. OS Linux (Historie, modularita)

Historie: 1969 UNIX (Bell Labs), 1991 Linus Torvalds, inspirován Minixem/Unixem.

Modularita: Kernel + Shell + GNU Tools + GUI (vše vyměnitelné).

Jádro (Kernel) řeší HW.

Shell řeší komunikaci s uživatelem.

GNU nástroje řeší příkazy.

Desktop environment (GNOME/KDE) řeší grafiku. Vše lze vyměnit.

### 19. Linuxové distribuce

Proč vznikají: Linux je jen jádro. Distribuce přidává instalátor, balíčkovací systém a výběr SW.

**RPM**: RedHat (RHEL), Fedora, CentOS, SUSE.

**DEB**: Debian, Ubuntu, Mint.

**Jiné**: Arch (pacman), Gentoo (kompiluje se), Slackware.

**Proč**: Jádro je stejné, liší se balíčkovací systém, verze knihoven a instalátor.

### 20. Use Case (Kde použít Linux)

**Server**: Bez grafiky, SSH, stabilita, skripty (cron).

**Embedded**: Routery, Raspberry Pi (malá velikost).

**Superpočítače**: Výkon, správa zdrojů.

**Proč**: Stabilita, bezpečnost, možnost automatizace (skripty), nulová cena licencí, běh bez grafiky (headless), otevřený kód.

### Bonus: Užitečné textové nástroje (Nutné pro praxi!)

**grep**: Hledá řádky s textem. (grep "chyba" log.txt)

**cut**: Vybírá sloupce. (cut -d: -f1 /etc/passwd = vypíše jen loginy)

**sort**: Seřadí řádky (-n číselně, -r pozpátku).

**uniq**: Odstraní duplicity (musí být seřazeno!). (sort | uniq)

**tr**: Mění znaky. (tr "a-z" "A-Z" = zvětší písmena)

**wc**: Počítá. (wc -l = počet řádků).
