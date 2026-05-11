library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity task1 is
    generic(
        N : integer := 4;
        MAX_VAL : integer := 10
    )
    port(
        clock : in std_logic;
        reset : in std_logic;
        en : in std_logic;
        cnt : out std_logic_vector(N - 1 downto 0);
        tick : out std_logic
    );

end task1;

architecture Behavioral of task1 is
   signal counter : unsigned(N - 1 downto 0);
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                counter <= (others => '0');
            else
                if en = '1' then
                    if counter >= unsigned(to_unsigned(MAX_VAL,N)) then
                        counter <= (others => '0');
                    else
                        counter <= counter + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    cnt <= std_logic_vector(counter);
    tick <= '1' when counter >= unsigned(to_unsigned(MAX_VAL,N)) else '0';

end Behavioral;