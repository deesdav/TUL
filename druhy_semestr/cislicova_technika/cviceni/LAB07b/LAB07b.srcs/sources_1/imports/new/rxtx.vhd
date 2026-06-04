library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rxtx is
    port(
        clock          : in  std_logic;
        shift_not_load : in  std_logic;
        SW             : in  std_logic_vector(15 downto 0);
        LED            : out std_logic_vector(15 downto 0);
        tx             : out std_logic_vector(1 downto 0);
        rx             : in  std_logic_vector(1 downto 0)
    );
end rxtx;

architecture Behavioral of rxtx is

begin

end Behavioral;
