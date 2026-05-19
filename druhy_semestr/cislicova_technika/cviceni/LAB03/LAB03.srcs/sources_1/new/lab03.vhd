library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab03 is
    port (
        a : in std_logic;
        q_inv : out std_logic
    );
end lab03;

architecture structural of lab03 is

    signal invertor : std_logic;    
    
begin

    invertor <= not a;
    q_inv <= invertor;

end structural;
