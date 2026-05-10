library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity limit_counter is
    generic(
        MAX_VAL : integer := 9;
        COUNTER_WIDTH : integer := 4
    )
    port (
        clk : in std_logic;
        rst : in std_logic;
        tick : out std_logic
    );
end limit_counter;

architecture Behavioral of limit_counter is
    signal s_cnt : unsigned(COUNTER_WIDTH-1 downto 0) := (others => '0'); 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s_cnt <= (others => '0');
            else
                if s_cnt >= to_unsigned(MAX_VAL, COUNTER_WIDTH) then
                    s_cnt <= (others => '0');
                else
                    s_cnt <= s_cnt + 1;
                end if;
            end if;
        end if;
    end process; 

    tick <= '1' when s_cnt >= to_unsigned(MAX_VAL, COUNTER_WIDTH) else '0';
    
end Behavioral;