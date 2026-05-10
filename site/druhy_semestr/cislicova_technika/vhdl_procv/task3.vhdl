library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task3 is
    port(
        clk : in std_logic;
        rst : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        din_par : in std_logic_vector(7 downto 0);
        din_ser : in std_logic;
        dout_par : out std_logic_vector(7 downto 0)
    );
end task3;

architecture Behavioral of task3 is
    signal s_reg : std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s_reg <= (others => '0');
            else
                case mode is
                    when "00"=>
                        s_reg <= s_reg;
                    when "01"=>
                        s_reg <= din_par;
                    when "10"=>
                        s_reg <= din_ser & s_reg(7 downto 1);
                    when "11"=>
                        s_reg <= s_reg(6 downto 0) & s_reg(7);
                    when others =>
                        s_reg <= s_reg;                  
                end case;
            end if;
        end if;
    end process;
    dout_par<= s_reg;

end Behavioral;