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
	signal s_reg    : std_logic_vector(15 downto 0) := x"0001";
    signal feedback : std_logic; 
begin
	feedback <= s_reg(5) xor s_reg(3) xor s_reg(2) xor s_reg(0);
	
	process(clock)
	begin 
		if rising_edge(clock) then
			if load = '1' then
				s_reg <= SW;
			else
				s_reg <= feedback & s_reg(15 downto 1);
			end if;	
		end if;
	end process;									   
	LED <= s_reg;
	

end Behavioral;
