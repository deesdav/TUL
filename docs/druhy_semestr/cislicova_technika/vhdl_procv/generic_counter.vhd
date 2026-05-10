library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity generic_counter is
    generic(
        MAX_VAL : integer := 9;
        COUNTER_WIDTH : integer := 4
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        en : in std_logic;
        q_out : out std_logic_vector(COUNTER_WIDTH - 1 downto 0)
    );
end entity generic_counter;

architecture Behavioral of generic_counter is
    signal s_counter : unsigned(COUNTER_WIDTH-1 downto 0); 
begin
    
    process(rst, clk)
    begin
        if rst = '1' then
            s_counter <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                if s_counter >= to_unsigned(MAX_VAL, COUNTER_WIDTH) then
                    s_counter <= (others => '0');
                else
                    s_counter <= s_counter + 1;
                end if;
            end if;
        end if;
    end process; 

    q_out <= std_logic_vector(s_counter);
    
end Behavioral;