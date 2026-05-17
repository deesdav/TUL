library IEEE;
use IEEE.std_logic_1164.all;

entity priority_encoder is
    port (
        a : in  std_logic_vector(6 downto 0);
        q : out std_logic_vector(2 downto 0)
    );
end entity priority_encoder;

architecture rtl of priority_encoder is
begin
    -- Souběžné podmíněné přiřazení (bez procesu!)
    q <= "111" when a(6) = '1' else
         "110" when a(5) = '1' else
         "101" when a(4) = '1' else
         "100" when a(3) = '1' else
         "011" when a(2) = '1' else
         "010" when a(1) = '1' else
         "001" when a(0) = '1' else
         "000";
end architecture rtl;