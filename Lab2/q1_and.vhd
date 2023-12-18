library IEEE;
use IEEE.std_logic_1164.all;


entity AND_Gate is
    port(x: in std_logic;
    y: in std_logic;
    z: out std_logic);
end entity;

architecture behaviour of AND_Gate is
    signal tmp: std_logic;
begin 
    tmp <= x and y;
    z  <= tmp;
end architecture;