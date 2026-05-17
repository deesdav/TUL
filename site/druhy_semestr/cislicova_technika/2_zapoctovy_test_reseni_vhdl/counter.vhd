library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    generic(
        WIDTH : integer := 4  -- Generický parametr pro šířku čítače
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        ce  : in std_logic;
        z   : out std_logic;  -- Z je výstupní port (indikátor nuly)
        q   : out std_logic_vector(WIDTH-1 downto 0) -- Výstup Q
    );
end entity counter;

architecture rtl of counter is
    -- Vnitřní signál
    signal s_cnt : unsigned(WIDTH-1 downto 0) := (others => '0'); 
begin
    
    process(clk)
    begin
        if falling_edge(clk) then       -- SESTUPNÁ HRANA
            if rst = '1' then           -- SYNCHRONNÍ RESET
                s_cnt <= (others => '0');
            elsif ce = '1' then         -- POVOLENÍ ČÍTÁNÍ (ce)
                s_cnt <= s_cnt - 1;     -- DEKREMENTACE
            end if;
        end if;
    end process;

    -- Přiřazení vnitřního signálu na výstup
    q <= std_logic_vector(s_cnt);
    
    -- Indikace nulové hodnoty
    z <= '1' when s_cnt = 0 else '0';
    
end architecture rtl;