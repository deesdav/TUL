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

```bash
## Témata ke zkoušce

### 1. Typy souborů v Linuxu

Specifikace: V Linuxu rozlišujeme soubory podle prvního znaku ve výpisu ls -l.

Jak je poznám & Příklady:

- Obyčejný soubor: Text, obrázek, program (např. /etc/passwd).

d Adresář: Seznam odkazů na jiné soubory (např. /home).

l Symbolický odkaz: Zástupce ukazující jinam (např. /bin/sh -> bash).

b / c Zařízení: Blokové (disk sda) nebo znakové (terminál tty, /dev/null).

Použití: Ukládání dat (obyčejné), organizace (adresáře), přístup k HW (zařízení).

### 2. Adresářový strom

Struktura: Jediný strom začínající kořenem / (Root).

Signifikantní adresáře:

/bin, /usr/bin – Příkazy pro uživatele (ls, cp).

/etc – Konfigurační soubory.

/home – Domovské adresáře uživatelů.

/var – Proměnná data (logy, e-maily).

/tmp – Dočasné soubory (mazány při restartu).

/dev – Soubory zařízení.

### 3. Cesty adresářovým stromem

Absolutní cesta: Začíná vždy /. Cesta od kořene. Nemění se podle toho, kde jsi.

Příklad: /home/student/dokumenty/text.txt

Použití: Ve skriptech (bezpečnost, jistota).

Relativní cesta: Nezačíná /. Cesta od aktuálního adresáře (pwd).

Příklad: dokumenty/text.txt nebo ../data

Použití: Pro rychlý pohyb v terminálu.

### 4. Filesystem, metadata, inode

Filesystem: Způsob organizace dat na fyzickém disku (formátování).

Příklady: ext4, xfs, btrfs.

Metadata: Data o datech (vlastník, oprávnění, čas změny, velikost). Neobsahují jméno souboru ani samotný obsah.

Inode: Datová struktura (tabulka) na disku uchovávající metadata konkrétního souboru. Každý soubor má své číslo inodu (lze vidět přes ls -li).

### 5. Uživatelé

Typy:

Root (UID 0): Správce, může vše.

Systémoví uživatelé: Pro běh služeb (www-data, mail), nemají login shell.

Běžní uživatelé (UID 1000+): Omezená práva.

Soubor s informacemi: /etc/passwd (obsahuje login, UID, GID, home adresář, shell). Hesla jsou (zašifrovaná) v /etc/shadow.

### 6. Skupiny (Grupy)

Definice: V souboru /etc/group. Slouží ke sdílení práv mezi více uživateli.

Jeden uživatel ve více skupinách? ANO. Má jednu primární (v /etc/passwd) a může mít více sekundárních.

Jeden soubor více skupinám? NE. Soubor patří vždy jen jednomu uživateli a jedné skupině.

### 7. Stavy procesu

Hlavní stavy:

R (Running): Běží nebo čeká na CPU.

S (Sleeping): Čeká na data/disk/klávesnici.

Z (Zombie): Skončil, ale rodič si nepřečetl výsledek.

T (Stopped): Pozastaven (např. přes CTRL+Z).

Změna stavu: Signálem (příkaz kill), uspáním, probuzením, dokončením I/O operace.

### 8. Monitorování procesů

Interaktivní: top, htop (neustále se aktualizuje).

Neinteraktivní: ps (výpis aktuálního stavu). Časté: ps aux nebo ps -ef.

Vlastnosti: PID (ID procesu), PPID (ID rodiče), USER (vlastník), %CPU, %MEM, NI (priorita), TIME, COMMAND.

### 9. Závislosti mezi procesy

Rodičovství: Rodič spouští potomka (fork). Rodič čeká na návratový kód potomka. Pokud rodič umře dřív, potomka se ujme systemd (init).

Kdo byl první: Proces s PID 1 (init/systemd).

Komunikace proměnnými: Proces dědí proměnné od rodiče (export). Potomek nemůže změnit proměnnou rodiči (jen sobě).

### 10. Spuštění příkazu

Jak shell pozná příkaz:

Je to absolutní/relativní cesta? (./skript.sh) -> Spustí to.

Je to alias nebo funkce? -> Spustí to.

Je to interní příkaz (built-in)? (cd, echo) -> Provede ho přímo shell.

Je to externí program? -> Hledá ho v adresářích uvedených v proměnné $PATH.

### 11. stdin, stdout, stderr

Proudy:

stdin (0): Vstup (klávesnice).

stdout (1): Výstup (obrazovka).

stderr (2): Chybový výstup (obrazovka).

Přesměrování: > (do souboru), >> (připojit), 2> (chyby), < (číst ze souboru).

Roura |: Vezme stdout prvního příkazu a pošle ho jako stdin druhému.

Příklad: cat soubor.txt | grep "slovo" (Vyhledá slovo v obsahu souboru).

### 12. Skripty v bashi

Co to je: Textový soubor s příkazy.

Vlastnosti:

Musí mít právo spustitelnosti (chmod +x soubor).

Hlavička (Shebang): #!/bin/bash na prvním řádku (určuje interpret).

Použití: Automatizace opakovaných úloh.

### 13. Proměnné v bashi

Typ: Vše je řetězec (string).

Naplnění: JMENO=hodnota (bez mezer!).

Volání: $JMENO nebo ${JMENO}.

Vlastní vs. Systémové:

Vlastní: pocet=5 (platí jen v aktuálním shellu, pokud nedám export).

Systémové: $USER (uživatel), $HOME (domov), $PATH (cesty), $PWD (kde jsem).

### 14. Podmínky v bashi

    Exit status: Návratová hodnota posledního příkazu ($?). 0 = OK, 1-255 = Chyba.

Podmíněný příkaz: && (spusť další, jen když první prošel), || (spusť další, když první selhal).

if:

if [ "$a" -eq 1 ]; then
echo "Je to jedna"
fi

### 15. Cykly v bashi

Druhy: for (pro seznam prvků), while (dokud platí podmínka).

Nekonečný cyklus: while true; do ... done.

Přerušení: break (konec cyklu), continue (další iterace).

### 16. Soubory k nastavení bashe

Kde: V domovském adresáři (~) nebo v /etc.

Soubory: .bashrc (pro interaktivní práci, aliasy), .profile / .bash_profile (při přihlášení).

Co v nich je: Nastavení promptu (PS1), aliasy (alias ll='ls -l'), úprava $PATH.

### 17. Terminál a shell

Terminál: Okno/HW, které zobrazuje znaky a posílá vstupy (např. Putty, xterm).

Shell: Program běžící na serveru, interpretuje příkazy (např. bash, sh, zsh).

Druhy: sh, bash, zsh, csh, fish. Seznam dostupných je v /etc/shells.

### 18. OS Linux (Historie, modularita)

Historie: 1991 Linus Torvalds, inspirován Minixem/Unixem.

Modularita: Linux je skládačka.

Jádro (Kernel) řeší HW.

Shell řeší komunikaci s uživatelem.

GNU nástroje řeší příkazy.

Desktop environment (GNOME/KDE) řeší grafiku. Vše lze vyměnit.

### 19. Linuxové distribuce

Proč vznikají: Linux je jen jádro. Distribuce přidává instalátor, balíčkovací systém a výběr SW.

Příklady:

Debian/Ubuntu: Stabilní, uživatelské (apt, .deb).
Red Hat (RHEL)/Fedora/CentOS: Serverové standardy (dnf/yum, .rpm).
Arch: Rolling release, pro pokročilé.

### 20. Use Case (Kde použít Linux)

Vhodné pro: Servery (web, databáze), superpočítače, embedded zařízení (routery, Raspberry Pi).

Proč: Stabilita, bezpečnost, možnost automatizace (skripty), nulová cena licencí, běh bez grafiky (headless), otevřený kód.
```
