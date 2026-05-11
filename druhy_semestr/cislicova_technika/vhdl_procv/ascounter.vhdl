library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity task1 is
    port(
        clk : in std_logic;
        rst : in std_logic;
        enable : in std_logic;
        counter : out std_logic_vector(3 downto 0)
    );

end task1;

architecture Behavioral of task1 is
    signal s_count : unsigned(3 downto 0);
begin

    process(rst, clk)
    begin
        if rst = '1' then
            s_count <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                s_cnt <= s_cnt + 1;
            end if;
        end if; 
    end process;

    counter <= std_logic_vector(s_cnt);
end Behavioral;