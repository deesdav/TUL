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

	constant C_10KHZ_WIDTH : integer := 14;
	constant C_10KHZ_LIMIT : integer := 9999;	
	
	signal s_en_10khz : std_logic;
	signal s_cnt_3bit : unsigned(2 downto 0);
	
	signal s_hex : std_logic_vector(3 downto 0);
	
begin
	
	clk_div_i : entity work.counter		 
		generic map (
	    	COUNTER_WIDTH => C_10KHZ_WIDTH
	    );
        port map(
            clock        => clock,
            cnt          => open,
            reset        => '0',
            clock_enable => '1',
            limit        => std_logic_vector(to_unsigned(C_10KHZ_LIMIT, C_10KHZ_WIDTH)),
            repeat       => '1',
            done         => s_en_10khz
        );
		
	process(clock)
	begin
	    if rising_edge(clock) then
	        if reset = '1' then
	            s_cnt_3bit <= (others => '0');
	        elsif s_en_10khz = '1' then
	             s_cnt_3bit <=  s_cnt_3bit + 1;
	        end if;	 
				
			case s_cnt_3bit is
			    when "000" =>
			        s_hex <= din(3 downto 0);
			        displays <= "11111110";	  
				when "001" =>
			        s_hex <= din(7 downto 4);
			        displays <= "11111101";		
				when "010" =>
					s_hex <= din(11 downto 8);   
			        displays <= "11111011";
				when "011" =>
					s_hex <= din(15 downto 12);
			        displays <= "11110111";		
				when "100" =>
					s_hex <= din(19 downto 16);
			        displays <= "11101111";	
				when "101" =>
					s_hex <= din(23 downto 20);
			        displays <= "11011111";	
				when "110" =>
					s_hex <= din(27 downto 24);
			        displays <= "10111111";
				when others =>
					s_hex <= din(31 downto 28);
			        displays <= "01111111";	
			end case;	
	    end if;	 

	end process;	  

	process(s_hex)
	begin
		case s_hex is	-- DP G F E D C B A
			when X"0" =>
			    segments <= "11000000";
			when X"1" =>
				segments <= "11111001";
			when X"2" =>
				segments <= "10100100";
			when X"3" =>
				segments <= "10110000";
			when X"4" =>
				segments <= "10010001";
			when X"5" =>
				segments <= "10010010";	 
			when X"6" =>
				segments <= "10000010";	
			when X"7" =>
				segments <= "11111000";		
			when X"8" =>
				segments <= "10000000";	  
			when X"9" =>
				segments <= "10100000";
			when X"A" =>
				segments <= "11001000";	  
			when X"b" =>
				segments <= "10000011";
			when X"C" =>
				segments <= "11000110";
			when X"d" =>
				segments <= "10100001";
			when X"E" =>
				segments <= "10000110";   
			when X"F" =>
			    segments <= "10001110";
			when others =>
			    segments <= "11111111";
		end case; 
		
	end process;

	
end Behavioral;
