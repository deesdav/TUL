library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR is
    port (
        clock : in  std_logic;
        load  : in  std_logic;
        SW    : in  std_logic_vector(15 downto 0);
        LED   : out std_logic_vector(15 downto 0)
    );
end LFSR;

architecture Behavioral of LFSR is

begin


end Behavioral;
