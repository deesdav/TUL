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
        if s = "00" then
            q <= d(0);
        elsif s = "01" then
            q <= d(1);
        elsif s = "10" then
            q <= d(2);
        else q <= d(3);
        end if;
        
    end process;

end Behavioral;
