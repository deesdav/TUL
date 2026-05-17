library ieee;
use ieee.std_logic_1164.all;

entity shreg is
    generic(
        -- N definujeme jako integer s nějakou výchozí hodnotou (např. 4 nebo 8)
        N : integer := 4 
    );
    port(
        clk : in std_logic;
        rst : in std_logic;
        sh  : in std_logic;
        s   : in std_logic_vector(N-1 downto 0);         -- N bitový vstup
        q   : out std_logic_vector((4*N)-1 downto 0)     -- 4x N bitový výstup
    );
end entity shreg;

architecture rtl of shreg is
    -- Vnitřní signál pro paměť registru (stejně velký jako výstup)
    signal s_reg : std_logic_vector((4*N)-1 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then          -- Náběžná hrana
            if rst = '1' then             -- Synchronní reset
                s_reg <= (others => '0');
            elsif sh = '1' then           -- Povolení posuvu
                -- Nová data 's' přilepíme zleva (MSB) k horním 3/4 starého obsahu.
                -- Nejspodnějších N bitů z (N-1 downto 0) tím pádem nenávratně zmizí.
                s_reg <= s & s_reg((4*N)-1 downto N);
            end if;
        end if;
    end process;

    -- Přiřazení vnitřní paměti na výstupní port
    q <= s_reg;

end architecture rtl;