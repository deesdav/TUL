library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is

    constant SIM_WIDTH : integer := 4;
    constant CLK_PERIOD : time := 10 ns;
    
    signal clock : std_logic := '1';

    -- inputs
    signal reset        : std_logic                                := '0';
    signal clock_enable : std_logic                                := '0';
    signal limit        : std_logic_vector(SIM_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(7, SIM_WIDTH));
    signal repeat       : std_logic                                := '0';
  
    signal cnt : std_logic_vector(SIM_WIDTH - 1 downto 0);
    signal done         : std_logic;

begin
    
    clock <= not clock after CLK_PERIOD / 2;

    DUT : entity work.counter
        generic map(
            COUNTER_WIDTH => SIM_WIDTH
        )
        port map(
            clock        => clock,
            cnt          => cnt,
            reset        => reset,
            clock_enable => clock_enable,
            limit        => limit,
            repeat       => repeat,
            done         => done
        );
        
    tb : process
    begin
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD * 2;
        clock_enable <= '1';
        wait;
    
    end process;
    

end Behavioral;
