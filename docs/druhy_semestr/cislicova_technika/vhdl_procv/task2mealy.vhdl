library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task2mealy is
    port(
        clk : in std_logic;
        rst : in std_logic;
        seq : in std_logic;
        found : out std_logic
    );
end task2mealy;

architecture Behavioral of task2mealy is
    type fsm_type is (StateStart, S1, S11);
    signal current_state, next_state : fsm_type;
begin

    mem : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current_state <= StateStart;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    transfer : process(current_state, seq)
    begin
        next_state <= StateStart;
        found <= '0';

        case current_state is
            when StateStart =>
                if seq = '1' then
                    next_state <= S1;
                else
                    next_state <= StateStart;
                end if;
            when S1 =>
                if seq = '1' then
                    next_state <= S11;
                else
                    next_state <= StateStart;
                end if;
            when S11 =>
                if seq = '0' then
                    found <= '1';   
                    next_state <= StateStart;
                else
                    next_state <= S11;
                end if;     
            when others =>
                next_state <= StateStart;
        end case;
    end process;
end Behavioral;