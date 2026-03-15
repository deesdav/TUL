library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity displays is
    Port(
        disp_sel : in  std_logic_vector(2 downto 0);
        char_sel : in  std_logic_vector(3 downto 0);
        displays : out std_logic_vector(7 downto 0);
        segments : out std_logic_vector(7 downto 0)
    );
end displays;

architecture Behavioral of displays is

begin

end Behavioral;
