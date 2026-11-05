library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_count is
    port (
        clock     : in  std_logic;
        reset     : in  std_logic;
        q_johnson : out std_logic_vector(3 downto 0);
         -- change 999 to correct value 
        q_binary  : out std_logic_vector(999 downto 0)
    );
end johnson_count;

architecture Behavioral of johnson_count is

begin

-- J.state  row     binary
-- 0000     0          


end Behavioral;
