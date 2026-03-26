library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor_tb is
end multiplexor_tb;

architecture testbench of multiplexor_tb is
    
    signal mux_d : std_logic_vector(3 downto 0);
    signal mux_s : std_logic_vector(1 downto 0);
    signal mux_q : std_logic;
    
    /*
        Converts unsigned integer (natural) val to std_logic_vector of required size 
    */
    function uint2slv(val : natural; size: positive) return std_logic_vector is
        variable retval : std_logic_vector(size - 1 downto 0);
        variable temp : natural;
    begin
        if val < 0 then
            retval := (others => 'X');
        elsif val = 0 then
            retval := (others => '0');
        else
            temp := val;
            for i in retval'reverse_range loop
                if temp mod 2 = 1 then
                    retval(i) := '1';
                else
                    retval(i) := '0';
                end if;
                temp := temp / 2;
            end loop;
        end if;
        return retval;				 
    end function uint2slv;
    
begin

    mux1_inst : entity work.multiplexor
        port map(
            d => mux_d,
            s => mux_s,
            q => mux_q
        );
        
    process
    begin
        wait for 10 ns;
        mux_d <= "0000";
        mux_s <= "00";
        wait for 10 ns;
        mux_d <= "0001";
        wait for 10 ns;
     
        mux_s <= "01";
        wait for 10 ns;
        mux_d <= "0010";
        wait for 10 ns;	   
		
		mux_s <= "10";
        wait for 10 ns;
        mux_d <= "0100";
        wait for 10 ns;
    
		mux_s <= "11";
        wait for 10 ns;
        mux_d <= "1000";
        wait for 10 ns;
	
        -- try to use function uint2slv together with for loop to test all possible input combinations
        -- the power operator ** could come in handy
        
        -- for loop template
        -- for <i> in <RANGE> loop
        -- <signal_name> <= uint2slv(<i>, <signal_name>'length);
        -- end loop;
        
        wait;
    end process;
    

end testbench;
