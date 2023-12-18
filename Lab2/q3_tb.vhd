library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component CHORD_Encoder
	    port(clk, rst: in std_logic;
	    a: in std_logic_vector(7 downto 0);
	    data_valid: out std_logic;
	    z: out std_logic_vector(7 downto 0));
	end component;
	signal input_sig, output_sig: std_logic_vector (7 downto 0);
	signal rst, data_valid : std_logic;
	signal clk : std_logic := '0';				
	signal bool_start_print : std_logic := '0';
begin
	dut_instance: CHORD_Encoder
	port map (a => input_sig, clk => clk, z => output_sig, data_valid => data_valid, rst => rst);
	
	process
		file input_file: text open read_mode is "input8.txt";
		file output_file: text open write_mode is "out8.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);	
		variable iter1 :integer:=0;
		variable iter2 :integer:=0;
	begin
		--if clk = '0' then clk <= '1'; else clk <= '0'; end if;
		while not endfile(input_file) loop
			readline (input_file, input_line);
			read (input_line, input_var);
			input_sig <= input_var;
			wait for 2 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 2 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 2 ns;
			--output_var := output_sig;
			--wait for 1 ns;
		end loop;
		
		input_sig<="00000000";
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 1 ns;


		while iter1 <= 100 loop
			wait for 2 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 2 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 2 ns;
			iter1 := iter1 + 1;
		end loop;


		input_sig <= "11111111";
		wait for 1 ns;
    	if clk = '0' then clk <= '1'; else clk <= '0'; end if;
    	wait for 10 ns;
		if clk = '0' then clk <= '1'; else clk <= '0'; end if;
		wait for 1 ns;
		-- After inputs from file send
		while iter2<100 loop
			wait for 1 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 1 ns;
			if clk = '0' then clk <= '1'; else clk <= '0'; end if;
			wait for 1 ns;
			output_var := output_sig;
			--if bool_start_print='0' then
			if output_var = "00000000" then 
				wait;
			end if;
			write (output_line, output_var);
			writeline (output_file, output_line);
			--end if;
			--bool_start_print <= '1';
			iter2:=iter2+1;
		end loop;
	wait;
--		if clk<='1' then
--			clk<='0';
--		else
--			clk <='1';
--		end if;
--		while not endfile(input_file) loop
--			--report "arohan "& std_logic'image(clk);
--			readline (input_file, input_line);
--			read (input_line, input_var);
--			input_sig <= input_var;
----			wait for 1 ns;
--			clk <= '1';
--			wait for 1 ns;
--			clk <= '0';			wait for 1 ns;
--
--			end loop;
--			if clk<='1' then
--				clk<='0';
--			else
--				clk <='1';
--			end if;
 --       while iter <20 loop
--			input_sig <= "11111111";
--	
--				output_var := output_sig;
--				if output_var /="UUUUUUUU" then
--				
--					write (output_line, output_var);
--					writeline (output_file, output_line);
--
--				end if;
--				if clk<='1' then
--					clk<='0';
--					else
--					clk <='1';
--					end if;
--				
--				bool_start_print <= '1';
--				iter:=iter+1;
--				end loop;
--	wait;
	end process;

end architecture;
