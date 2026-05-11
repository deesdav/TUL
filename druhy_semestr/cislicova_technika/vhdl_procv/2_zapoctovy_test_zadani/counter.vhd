library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    generic(
        WIDTH : integer := 4;
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        ce : in std_logic;
        z : out std_logic;
        q : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity counter;

architecture rtl of counter is
    signal s_cnt : unsigned(WIDTH-1 downto 0) := (others => '0'); 
begin

    process(clk)
    begin
        if falling_edge(clk) then
            if rst = '1' then
                s_cnt <= (others => '0');
            elsif ce = "1" then
                s_cnt <= s_cnt - 1;
            end if;
        end if;
    end process;

    q <= std_logic_vector(s_cnt);

    z <= '1' when s_cnt = 0 else '0';
    
end rtl;