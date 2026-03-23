library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port (
        SW : in std_logic_vector(15 downto 0);
        LED : out std_logic_vector(15 downto 0)
    );
end top;

architecture Behavioral of top is

begin

    -- insert two muxes here
    
    -- insert a decoder here

end Behavioral;
