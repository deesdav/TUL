library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detektor_sequence is
    port (
        rst : in std_logic;
        clk : in std_logic;
        data_in : in std_logic;
        match : out std_logic
    );
end entity detektor_sequence;

architecture Behavioral of detektor_sequence is
    type fsm_type is (StateStart, S1, S10, S101, S1011);
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

    transfer : process(current_state, data_in)
    begin
        next_state <= StateStart;
        match <= '0';

        case current_state is
            when StateStart =>
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= StateStart;
                end if;
            when S1 =>
                if data_in = '0' then
                    next_state <= S10;
                else
                    next_state <= S1;    
                end if;
            when S10 =>
                if data_in = '1' then
                    next_state <= S101;
                else
                    next_state <= StateStart;
                end if; 
            when S101 =>
                if data_in = '1' then
                    next_state <= S1011;
                else
                    next_state <= S10;
                end if;
            when S1011 =>
                match <= '1';
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= S10;
                end if;  
            when others =>
                next_state <= StateStart;
        end case;
    end process;
    
end architecture Behavioral;