library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is

    signal x1:std_logic;
    signal g:std_logic;

    component NOT_Gate is
        port(x: in std_logic;
        z: out std_logic);
    end component;

begin 

    dut_instance: NOT_Gate
    port map(x => x1, z => g);

    process
    begin
            x1 <= '0';

            wait for 1 ns;

            x1 <= '1';

            wait for 1 ns;
    
    end process;
end architecture;

