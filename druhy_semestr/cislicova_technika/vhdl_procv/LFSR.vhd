library IEEE;
use IEEE.std_logic_1164.all;

entity LFSR is
    port (
        clk : in std_logic;
        rst : in std_logic;
        q_out : out std_logic_vector(3 downto 0)
    );
end entity LFSR;
architecture Behavioral of LFSR is
    signal s_reg : std_logic_vector(3 downto 0) := "0001"; 
begin

    process(rst, clk)
    begin
        if rst = '1' then
            s_reg <= "0001";
        elsif rising_edge(clk) then 
            s_reg <= s_reg(2 downto 0) & (s_reg(3) xor s_reg(2));
        end if;
    end process;

    q_out <= s_reg;
    
end architecture Behavioral;
