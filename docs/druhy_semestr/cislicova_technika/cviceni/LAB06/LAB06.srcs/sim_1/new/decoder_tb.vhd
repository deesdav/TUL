library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

entity decoder_tb is
end decoder_tb;

architecture Behavioral of decoder_tb is

	-- create required signals 
	signal dec_d : std_logic_vector(1 downto 0) := (others => '0');
	signal dec_q : std_logic_vector(3 downto 0);

    
begin    

    -- insert decoder instance here
    
	dec_inst : entity work.decoder
    	port map(
	        d => dec_d,
	        q => dec_q
    );
        
	-- best way to do is to copy entity declaration and modify it
    
    -- insert testbench control process here   
	
	process
    begin			 
		
		wait for 10 ns;
		dec_d <= "00";
		wait for 10 ns;
		dec_d <= "01";
		wait for 10 ns;
		dec_d <= "10";
		wait for 10 ns;	   
		dec_d <= "11";	  
		wait;
		
	end process;
	
	

end Behavioral;
