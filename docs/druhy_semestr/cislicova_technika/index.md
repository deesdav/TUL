# Číslicová technika

Číslicová technika představuje základní kurz zaměřený na principy fungování digitálních systémů. Studenti se seznámí s tím, jak jsou na nejnižší úrovni reprezentována data a jak probíhají logické operace v procesorech a dalších digitálních obvodech.

## Základní informace

- **Katedra:** Katedra mechatroniky a počítačového řízení (KMP)
- **Zakončení:** Zápočet + Zkouška
- **Forma výuky:** Přednášky a praktické laboratorní cvičení

## Obsah předmětu

Kurz pokrývá cestu od základních logických členů až po složitější sekvenční obvody:

1. **Číselné soustavy a kódy:** Binární, hexadecimální soustava, doplňkový kód, BCD kód a Grayův kód.
2. **Booleova algebra:** Logické operace (AND, OR, NOT, NAND, NOR, XOR), minimalizace logických funkcí pomocí Karnaughových map.
3. **Kombinační logické obvody:** Kodéry, dekodéry, multiplexory, demultiplexory, sčítačky a komparátory.
4. **Sekvenční logické obvody:** Klopné obvody (RS, D, JK, T), registry, čítače a synchronní automaty.
5. **Paměti a programovatelná logika:** Typy pamětí (ROM, RAM) a základy struktur typu FPGA/CPLD.

## Podmínky zakončení

### Zápočet

Zápočet se získává především za práci v laboratořích:

- **Laboratorní úlohy:** Praktické zapojování obvodů na nepájivém poli nebo simulace v softwaru.
- **Protokoly:** Zpracování výsledků z měření a simulací v předepsané formě.
- **Kontrolní testy:** Teoretické testy v průběhu semestru zaměřené na návrh a minimalizaci obvodů.

### Zkouška

Zkouška prověřuje schopnost navrhnout konkrétní digitální zařízení:

- **Písemná část:** Návrh kombinačních a sekvenčních obvodů (např. navrhnout čítač nebo automat, který rozpoznává sekvenci bitů).
- **Ústní část:** Diskuse nad principy, technologiemi výroby integrovaných obvodů a architekturou číslicových systémů.

[Image of a logic circuit diagram with AND, OR and NOT gates]

## Doporučení a tipy

- **Karnaughovy mapy:** Naučte se je perfektně. Jsou základem pro většinu příkladů u zkoušky i v testech.
- **Laboratoře nepodceňujte:** Pokud si v laboratořích osaháte reálné součástky, teorie z přednášek vám začne dávat mnohem větší smysl.
- **Logika:** Předmět nevyžaduje složité výpočty jako Matematika 2, ale vyžaduje logické a analytické myšlení.
- **Software:** Často se využívají simulační nástroje (např. Logisim, Multisim nebo Quartus), které vám umožní si obvody nasimulovat i doma.

## Přehled výuky

<iframe src="https://elearning.tul.cz/course/view.php?id=20683" width="100%" height="800px"></iframe>

- [Přehled na Elearning](https://elearning.tul.cz/course/view.php?id=20683)

## Skripta

<iframe src="skripta_21_03_12.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na Skripta](skripta_21_03_12.pdf)

## Přednášky

### 1. Hradla

<iframe src="./prednasky/P01_hradla.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na P01_hradla.pdf](./prednasky/P01_hradla.pdf)

### 2. Booleova algebra

<iframe src="./prednasky/P02_booleova_algebra.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na P02_booleova_algebra.pdf](./prednasky/P02_booleova_algebra.pdf)

### 3. Používané logické funkce a jejich popis ve VHDL

<iframe src="./prednasky/CIE_3.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na CIE_3.pdf](./prednasky/CIE_3.pdf)

### 3. Používané logické funkce a jejich popis ve VHDL - příklady

<iframe src="./prednasky/CIE_3_priklady.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na CIE_3_priklady.pdf](./prednasky/CIE_3_priklady.pdf)

### 4. Klopné obvody

<iframe src="./prednasky/CIE_4.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na CIE_4.pdf](./prednasky/CIE_4.pdf)

### 5. Sekvenční logické systémy a automaty

<iframe src="./prednasky/CIE_5.pdff" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na CIE_5.pdf](./prednasky/CIE_5.pdf)

## Cvičení

### 1. Hradla

<iframe src="./cviceni/LAB01.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na LAB01.pdf](./cviceni/LAB01.pdf)

### 2. Booleova algebra

<iframe src="./cviceni/LAB02b-Zakony_Bool.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na LAB02b-Zakony_Bool.pdf](./cviceni/LAB02b-Zakony_Bool.pdf)

<iframe src="./cviceni/LAB02c-Upravy_log_vyrazu.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na LAB02c-Upravy_log_vyrazu.pdf](./cviceni/LAB02c-Upravy_log_vyrazu.pdf)

### 3. Vivado, VHDL jazyk

<iframe src="./cviceni/LAB_03.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na LAB_03.pdf](./cviceni/LAB_03.pdf)

### 4. Podmíněné přiřazení, multiplexor

<iframe src="./cviceni/LAB_04.pdf" width="100%" height="800px"></iframe>

- [Otevřít / Stáhnout na LAB_04.pdf](./cviceni/LAB_04.pdf)

#### multiplexory.vhdl

```vhdl
-- 1. Strukturní popis pomocí logických hradel pro výstup q_struct
q_struct <= (a and not sel) or (b and sel);

-- 2. Behaviorální popis pomocí podmíněného přiřazení pro výstup q_condition
q_condition <= a when sel = '0' else b;


-- a. Na první dvě diody přiřaďte log. 0 (použití agregátu)
LEDs(1 downto 0) <= (others => '0');

-- b. Na diody 2 a 3 přiřaďte log. 1
LEDs(3 downto 2) <= "11";

-- c. Na další 4 diody přiřaďte první čtyři přepínače
LEDs(7 downto 4) <= switches(3 downto 0);

-- d. Na posledních 8 diod přiřaďte 4 přepínače (z obrázku switches 15 až 12) pomocí operátoru slučování '&'
LEDs(15 downto 8) <= switches(15) & switches(15) & switches(14) & switches(14) & switches(13) & switches(13) & switches(12) & switches(12);

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
    Port (
           d : in STD_LOGIC_VECTOR (7 downto 0); -- Vstupní datový port
           s : in STD_LOGIC_VECTOR (2 downto 0); -- Výběrový vstupní port
           q : out STD_LOGIC                     -- Výstupní port
         );
end multiplexor;

architecture Behavioral of multiplexor is
begin
    -- Podmíněné přiřazení pro 8-vstupý multiplexor
    q <= d(0) when s = "000" else
         d(1) when s = "001" else
         d(2) when s = "010" else
         d(3) when s = "011" else
         d(4) when s = "100" else
         d(5) when s = "101" else
         d(6) when s = "110" else
         d(7); -- Poslední větev 'else' bez podmínky
end Behavioral;
```
