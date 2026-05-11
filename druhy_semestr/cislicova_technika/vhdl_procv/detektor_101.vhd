library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detektor_101 is
    port (
        clk : in std_logic;
        rst : in std_logic;
        data_in : in std_logic;
        match : out std_logic
    );
end entity detektor_101;
architecture Behavioral of detektor_101 is
    type fsm_type is (S0, S1, S2, S3);
    signal current_state, next_state : fsm_type;
begin
  
    --moore
    mem: process(rst,clk)
    begin
        if rst = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    transfer: process(current_state, data_in)
    begin
        next_state <= S0;
        match <= '0';
        case current_state is
            when S0 =>
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                if data_in = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
            when S2 =>
                if data_in = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
            when S3 =>
                match <= '1';
                if data_in = '1' then
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;
            when others =>
                next_state <= S0;
        
        end case;
    end process;
    
    
end Behavioral;