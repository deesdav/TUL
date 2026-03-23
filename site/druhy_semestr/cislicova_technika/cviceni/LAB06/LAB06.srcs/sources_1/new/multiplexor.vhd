library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity multiplexor is
    port (
        d : in std_logic_vector(3 downto 0);
        s : in std_logic_vector(1 downto 0);
        q : out std_logic
    );
end multiplexor;

architecture Behavioral of multiplexor is

begin

    process(all)
    begin
        -- insert if here
    end process;

end Behavioral;
