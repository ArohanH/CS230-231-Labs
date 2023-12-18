library IEEE;
use IEEE.std_logic_1164.all;

entity Testbench is
end entity;

architecture tb of Testbench is
    
    signal I0: std_logic_vector (3 downto 0);
    signal Y0: std_logic_vector(1 downto 0);

    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0));
    end component;

begin

    dut_instance: encoder4x2
    port map(I=>I0, Y=>Y0);

    process
    begin

        I0 <= "1000";
        
        wait for 1 ns;

        I0 <= "0100";
        
        wait for 1 ns;

        I0 <= "0010";
        
        wait for 1 ns;

        I0 <= "0001";
        
        wait for 1 ns;
    
    end process;
end architecture;

        

        