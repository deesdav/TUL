library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port(
        clock                                             : in  std_logic;
        btn_up, btn_right, btn_down, btn_left, btn_center : in  std_logic;
        SW                                                : in  std_logic_vector(15 downto 0);
        LED                                               : out std_logic_vector(15 downto 0);
        LED_BLUE                                          : out std_logic
    );
end top;

architecture Behavioral of top is

    constant BOARD_WIDTH : integer                                    := 16;
    signal limit         : std_logic_vector(BOARD_WIDTH - 1 downto 0) := (others => '0');

begin

    counter_sixteen : entity work.counter
        generic map(
            COUNTER_WIDTH => BOARD_WIDTH
        )
        port map(
            clock        => clock,
            cnt          => LED,
            reset        => '0',
            clock_enable => '0',
            limit        => limit,
            repeat       => '0',
            done         => open
        );
        
--    debounce_inst : entity work.debounce
--        port map(
--            clock        => clock,
--            -- connect to a button of your choice
--            button       => btn_up,
--            -- create a signal and connect it to the clock_enable port of the counter above
--            pressed      => open
--        );

end Behavioral;
