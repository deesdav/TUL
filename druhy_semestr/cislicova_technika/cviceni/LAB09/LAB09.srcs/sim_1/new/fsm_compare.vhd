library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_compare is
end fsm_compare;

architecture Behavioral of fsm_compare is

    constant CLK_P : time := 10 ns;

    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal seq : std_logic := '0';

    signal moore_found, mealy_found : std_logic;

begin
    
    clk <= not clk after CLK_P / 2;

    MOORE : entity work.fsm_moore
        port map(
            clk   => clk,
            rst   => rst,
            seq   => seq,
            found => moore_found
        );

    MEALY : entity work.fsm_mealy
        port map(
            clk   => clk,
            rst   => rst,
            seq   => seq,
            found => mealy_found
        );
        
    tb : process
    begin
        -- insert your stimulus here
        wait;
    end process;

end Behavioral;
