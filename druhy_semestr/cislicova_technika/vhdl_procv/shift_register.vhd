library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register is
    port (
        clk : in std_logic;
        rst : in std_logic;
        ser_in : in std_logic;
        load : in std_logic;
        par_in : in std_logic_vector(3 downto 0);
        q_out : out std_logic_vector(3 downto 0)
        );
end entity shift_register;
architecture Behavioral of shift_register is
    signal s_reg : std_logic_vector(3 downto 0) := (others => '0');
begin
    
    process(rst, clk)
    begin
        if rst = '1' then
            s_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                s_reg <= par_in;
            else
                s_reg <= s_reg(2 downto 0) & ser_in;
            end if; 
        end if;
    end process;

    q_out <= s_reg;
    
end architecture Behavioral;
