library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_driver is
    port(
        clock    : in  std_logic;
        reset    : in  std_logic;
        din      : in  std_logic_vector(31 downto 0);
        segments : out std_logic_vector(7 downto 0);
        displays : out std_logic_vector(7 downto 0)
    );
end display_driver;

architecture Behavioral of display_driver is

begin

end Behavioral;
