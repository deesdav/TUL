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
	mux1_inst : entity work.multiplexor
    port map(
        d => SW(3 downto 0),
        s => SW(5 downto 4),
        q => LED(0)
    );			   
	
	mux2_inst : entity work.multiplexor
    port map(
        d => SW(3 downto 0),
        s => SW(7 downto 6),
        q => LED(1)
    );
	
    
    -- insert a decoder here	
	dec1_inst : entity work.decoder
    port map(
        d => SW(9 downto 8),
        q => LED(5 downto 2)
    );
	
	dec2_inst : entity work.decoder
    port map(
        d => SW(11 downto 10),
        q => LED(9 downto 6)
    );
	

end Behavioral;
