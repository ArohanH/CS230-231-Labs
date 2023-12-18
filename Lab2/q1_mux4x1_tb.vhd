library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is
    
    signal D0: std_logic_vector (3 downto 0);
    signal S0: std_logic_vector(1 downto 0);
    signal g: std_logic;
    
    component mux4x1 is
        port(D: in std_logic_vector (3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component; 
begin 
    
    dut_instance: mux4x1
    port map(D => D0, S => S0, Y => g);

    process 
    begin

        D0 <= "0000";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0000";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0000";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0000";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0001";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0001";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0001";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0001";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0010";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0010";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0010";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0010";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0011";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0011";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0011";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0011";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0100";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0100";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0100";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0100";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0101";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0101";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0101";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0101";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0110";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0110";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0110";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0110";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "0111";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "0111";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "0111";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "0111";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "1000";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1000";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1000";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1000";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "1001";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1001";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1001";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1001";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "1010";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1010";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1010";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1010";
        S0 <= "11";

        wait for 1 ns;

        D0 <= "1011";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1011";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1011";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1011";
        S0 <= "11";

        wait for 1 ns;

        
        D0 <= "1100";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1100";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1100";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1100";
        S0 <= "11";

        wait for 1 ns;

        
        D0 <= "1101";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1101";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1101";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1101";
        S0 <= "11";

        wait for 1 ns;

        
        D0 <= "1110";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1110";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1110";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1110";
        S0 <= "11";

        wait for 1 ns;

        
        D0 <= "1111";
        S0 <= "00";

        wait for 1 ns;

        D0 <= "1111";
        S0 <= "01";

        wait for 1 ns;

        D0 <= "1111";
        S0 <= "10";

        wait for 1 ns;

        D0 <= "1111";
        S0 <= "11";

        wait for 1 ns;

    end process;
end architecture;


        