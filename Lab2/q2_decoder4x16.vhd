library IEEE;
use IEEE.std_logic_1164.all;

entity decoder4x16 is
    port(a, b, c, d, enable: in std_logic;
    dec: out std_logic_vector(15 downto 0));
end entity;

architecture behaviour of decoder4x16 is

    signal Y: std_logic_vector (3 downto 0);
    signal Y1: std_logic_vector (3 downto 0);
    signal Y2: std_logic_vector (3 downto 0);
    signal Y3: std_logic_vector (3 downto 0);
    signal Y4: std_logic_vector (3 downto 0);
    component decoder2x4 is
        port(A, B, Enable: in std_logic;
        Dec: out std_logic_vector(3 downto 0));
    end component;
begin
    
    dut_instance0: decoder2x4
    port map(A=>a, B=>b, Enable=>enable, Dec=>Y);

    dut_instance1: decoder2x4
    port map(A=>c, B=>d, Enable=>Y(3), Dec=>Y1);

    dut_instance2: decoder2x4
    port map(A=>c, B=>d, Enable=>Y(2), Dec=>Y2);

    dut_instance3: decoder2x4
    port map(A=>c, B=>d, Enable=>Y(1), Dec=>Y3);

    dut_instance4: decoder2x4
    port map(A=>c, B=>d, Enable=>Y(0), Dec=>Y4);

    dec(0) <= Y1(3);
    dec(1) <= Y1(2);
    dec(2) <= Y1(1);
    dec(3) <= Y1(0);
    dec(4) <= Y2(3);
    dec(5) <= Y2(2);
    dec(6) <= Y2(1);
    dec(7) <= Y2(0);
    dec(8) <= Y3(3);
    dec(9) <= Y3(2);
    dec(10) <= Y3(1);
    dec(11) <= Y3(0);
    dec(12) <= Y4(3);
    dec(13) <= Y4(2);
    dec(14) <= Y4(1);
    dec(15) <= Y4(0);

end architecture;

    

    

