library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task4 is
    port(
        clk : in std_logic;
        q_out : out std_logic_vector(3 downto 0)
    );
end task4;

architecture Behavioral of task4 is
    signal s_reg : std_logic_vector(3 downto 0) := "0001";
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if s_reg = "0000" then
                s_reg <= "0001";
            else
                s_reg <= s_reg(2 downto 0) & (s_reg(3) xor s_reg(2));
            end if;
        end if;
    end process;

    q_out <= s_reg;

end Behavioral;