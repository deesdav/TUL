library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity spi_transmitter is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        start   : in std_logic;
        data_in : in std_logic_vector(3 downto 0);
        tx_out  : out std_logic;
        ready   : out std_logic
    );
end entity spi_transmitter;

architecture Behavioral of spi_transmitter is
    signal s_reg : std_logic_vector(3 downto 0);
    signal s_cnt_tacks : unsigned(3 downto 0);
begin
    process(rst, clk)
    begin
        if rst = '1' then
            ready <= '1';
            tx_out <= '0';
            s_reg <= (others => '0');
            s_cnt_tacks <= (others => '0');
        elsif rising_edge(clk) then
            if s_cnt_tacks > 0 then
                tx_out <= s_reg(0);
                s_reg <= '0' & s_reg(3 downto 1);
                s_cnt_tacks <= s_cnt_tacks - 1;
            else
                if start = '1' then
                    s_reg <= data_in;
                    ready <= '0';
                    s_cnt_tacks <= "0100";
                else
                    tx_out <= '0';
                    ready <= '1';
                end if;
            end if;
        end if;
    end process;
    
end architecture Behavioral;