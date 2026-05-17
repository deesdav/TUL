library IEEE;
use IEEE.std_logic_1164.all;

entity ones_counter is
    port (
        q : in  std_logic_vector(2 downto 0);
        a : out std_logic_vector(1 downto 0)
    );
end entity ones_counter;

architecture rtl of ones_counter is
begin
    -- Souběžné výběrové přiřazení (bez procesu!)
    with q select
        a <= "00" when "000",
             "01" when "001" | "010" | "100",
             "10" when "011" | "101" | "110",
             "11" when "111",
             "00" when others;
end architecture rtl;