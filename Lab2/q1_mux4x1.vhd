library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end entity; 
architecture behaviour of mux4x1 is
    signal s0,s1: std_logic;
    signal b1,b2: std_logic;
    signal c1,c2: std_logic;
    signal d1,d2: std_logic;
    signal e1,e2: std_logic;
    signal f1,f2: std_logic;
    signal g:std_logic;
    component OR_Gate is
        port(x: in std_logic;
        y: in std_logic;
        z: out std_logic);
    end component;
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
    port map(x=>S(0), z=>s0);
    
    dut_instance1: NOT_Gate
    port map(x=>S(1), z=>s1);

    dut_instance2: AND_Gate
    port map(x=>s0,y=>s1,z=>b1);

    dut_instance3: AND_Gate
    port map(x=>b1,y=>D(0),z=>b2);

    dut_instance4: AND_Gate
    port map(x=>S(0),y=>s1,z=>c1);

    dut_instance5: AND_Gate
    port map(x=>c1,y=>D(1),z=>c2);

    dut_instance6: AND_Gate
    port map(x=>s0,y=>s(1),z=>d1);

    dut_instance7: AND_Gate
    port map(x=>d1,y=>D(2),z=>d2);

    dut_instance8: AND_Gate
    port map(x=>S(0),y=>S(1),z=>e1);

    dut_instance9: AND_Gate
    port map(x=>e1,y=>D(3),z=>e2);

    dut_instance10: OR_Gate
    port map(x=>b2, y=>c2, z=>f1);

    dut_instance11: OR_Gate
    port map(x=>d2, y=>e2, z=>f2);

    dut_instance12: OR_Gate
    port map(x=>f1, y=>f2, z=>g);

    Y <= g;
end architecture;
    




