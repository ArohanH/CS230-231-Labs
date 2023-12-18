library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is
    signal a1,b1,c1,d1: std_logic;
    signal Y: std_logic_vector (15 downto 0);
    component decoder4x16 is
        port(a, b, c, d, enable: in std_logic;
        dec: out std_logic_vector(15 downto 0));
    end component;
begin
    
      
    dut_instance: decoder4x16
    port map(a => a1, b => b1, c => c1, d => d1, enable => '1', dec=>Y);

    process 
    begin
        
        a1 <= '0';
        b1 <= '0';
        c1 <= '0';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '0';
        c1 <= '0';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '0';
        c1 <= '1';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '0';
        c1 <= '1';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '1';
        c1 <= '0';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '1';
        c1 <= '0';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '1';
        c1 <= '1';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '0';
        b1 <= '1';
        c1 <= '1';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '0';
        c1 <= '0';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '0';
        c1 <= '0';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '0';
        c1 <= '1';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '0';
        c1 <= '1';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '1';
        c1 <= '0';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '1';
        c1 <= '0';
        d1 <= '1';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '1';
        c1 <= '1';
        d1 <= '0';

        wait for 1 ns;

        a1 <= '1';
        b1 <= '1';
        c1 <= '1';
        d1 <= '1';

        wait for 1 ns;
    end process;
end architecture;

