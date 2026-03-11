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