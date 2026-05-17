library IEEE;
use IEEE.std_logic_1164.all;

entity fsm is
    port (
        clk, x : in std_logic;
        y      : out std_logic
    );
end fsm;

architecture rtl of fsm is
    type fsm_type is (A, B, C);
    signal current_state, next_state : fsm_type;
begin
    
    -- 1. PROCES: Pouze paměť (hodiny)
    process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- 2. PROCES: Kombinační logika (přechody a výstupy)
    process(current_state, x)
    begin
        -- Výchozí hodnoty jako ochrana proti nechtěným pamětem
        next_state <= A;
        y <= '0';
        
        case current_state is
            when A =>
                if x = '1' then
                    y <= '0';
                    next_state <= B;
                else
                    y <= '0';
                    next_state <= A;
                end if;
            when B =>
                if x = '0' then
                    y <= '1';
                    next_state <= C;
                else
                    y <= '0';
                    next_state <= B;
                end if;
            when C =>
                if x = '0' then
                    y <= '1';
                    next_state <= C;
                else
                    y <= '0';
                    next_state <= A;
                end if;
            when others =>
                next_state <= A;
        end case;

    end process;
    
end rtl;