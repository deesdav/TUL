library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity debounce is
    port(
        clock        : in  std_logic;
        button       : in  std_logic;
        pressed      : out std_logic        
    );
end debounce;

architecture Behavioral of debounce is
    
    -- change values to create 100 Hz pulses.
    constant DIV100HZ_WIDTH : integer := 20;
    constant DIV100HZ_LIMIT : integer := 999999;
    
    signal div100Hz_done : std_logic;

    signal last_button_value : std_logic;
    signal actual_button_value : std_logic;

begin
    
    clock_div : entity work.counter
        generic map(
            COUNTER_WIDTH => DIV100HZ_WIDTH
        )
        port map(
            clock        => clock,
            cnt          => open,
            reset        => '0',
            clock_enable => '1',
            limit        => std_logic_vector(to_unsigned(DIV100HZ_LIMIT, DIV100HZ_WIDTH)),
            repeat       => '1',
            done         => div100Hz_done
        );
    
    -- register updates each 100 ms
    process(clock)
    begin
        if rising_edge(clock) then
            if div100Hz_done = '1' then
                actual_button_value <= button;
                last_button_value <= actual_button_value;
            end if;
        end if;
    end process;
    
    process(clock)
    begin
        if rising_edge(clock) then
            pressed <= '0';
            if div100Hz_done = '1' then
                -- detect rising edge or falling edge
                if actual_button_value = '1' and last_button_value = '0' then
                    pressed <= '1';
                end if;
            end if;
        end if;
    end process;    

end Behavioral;
