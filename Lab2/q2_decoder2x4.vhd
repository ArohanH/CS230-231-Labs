library IEEE;
use IEEE.std_logic_1164.all;

entity decoder2x4 is
    port(a, b, enable: in std_logic;
    dec: out std_logic_vector(3 downto 0));
end entity;

architecture behaviour of decoder2x4 is

    signal a0,a1,b1,c1,d1,e1: std_logic;
    component AND_Gate is
        port(x: in std_logic;
        y: in std_logic;
        z: out std_logic);
    end component;
    component NOT_Gate is
        port(x: in std_logic;
        z: out std_logic);
    end component;

begin 

    dut_instance: NOT_Gate
    port map(x=>a, z=>a1);

    dut_instance1: NOT_Gate
    port map(x=>b, z=>a0);

    dut_instance2: AND_Gate
    port map(x=>a,y=>b,z=>b1);

    dut_instance3: AND_Gate
    port map(x=>b1,y=>enable,z=>dec(0));

    dut_instance4: AND_Gate
    port map(x=>a,y=>a0,z=>c1);

    dut_instance5: AND_Gate
    port map(x=>c1,y=>enable,z=>dec(1));

    dut_instance6: AND_Gate
    port map(x=>a1,y=>b,z=>d1);

    dut_instance7: AND_Gate
    port map(x=>d1,y=>enable,z=>dec(2));

    dut_instance8: AND_Gate
    port map(x=>a1,y=>a0,z=>e1);

    dut_instance9: AND_Gate
    port map(x=>e1,y=>enable,z=>dec(3));

end architecture;

    
