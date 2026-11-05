library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simple_reg is
    port(
        clock      : in  std_logic;     -- synchronous clock signal connected to push button
        reset      : in  std_logic;     -- reset signal
        data       : in  std_logic;     -- data signal
        enable     : in  std_logic;     -- enable signal
        q_ff_re    : out std_logic;     -- a flip flop 
        q_latch    : out std_logic;     -- latch output
        q_ff_re_sr : out std_logic;     -- a flip flop with synchronous reset output, rising edge
        q_ff_fe_ar : out std_logic      -- a flip flop with asynchronous reset output, falling edge
    );
end simple_reg;

architecture Behavioral of simple_reg is

    signal ff_re : std_logic := '1';

begin

    -- Rising edge flipflop
    process(clock)
    begin
        if rising_edge(clock) then
            ff_re <= data;
        end if;
    end process;
    q_ff_re <= ff_re;

end Behavioral;
