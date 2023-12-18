library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;

entity CHORD_Encoder is
    	port(clk, rst: in std_logic;
    	a: in std_logic_vector(7 downto 0);
    	data_valid: out std_logic;
    	z: out std_logic_vector(7 downto 0));
end entity;

architecture behaviour of CHORD_Encoder is
    type std_logic_vector_array is array(natural range <>) of std_logic_vector(7 downto 0);
    signal letter :std_logic_vector_array(0 to 11);
    signal array1: std_logic_vector(511 downto 0) :=(others =>'0');
    signal output_process_bool : std_logic := '0'; 
    signal arrayout: std_logic_vector(511 downto 0) :=(others =>'0');
begin
    letter(0) <= "01000011";
    letter(1) <= "01100100";
    letter(2) <= "01000100";
    letter(3) <= "01100101";
    letter(4) <= "01000101";
    letter(5) <= "01000110";
    letter(6) <= "01100111";
    letter(7) <= "01000111";
    letter(8) <= "01100001";
    letter(9) <= "01000001";
    letter(10) <= "01100010";
    letter(11) <= "01000010";   
 	
    process(clk)
    variable count: integer :=0;
    
    

    variable count1: integer :=1; 
    variable count2: integer:=1;
    variable count3: integer:=1;
    variable count4: integer:=0;
    variable prevcount: integer:=0;
    variable count5: integer:=1;
    variable count6: integer:=1;
    
    variable arr1: std_logic_vector(7 downto 0):= "01000011";--C
    variable arr2: std_logic_vector(7 downto 0):= "01100100";--d
    variable arr3: std_logic_vector(7 downto 0):= "01000100";--D
    variable arr4: std_logic_vector(7 downto 0):= "01100101";--e
    variable arr5: std_logic_vector(7 downto 0):= "01000101";--E
    variable arr6: std_logic_vector(7 downto 0):= "01100110";--f
    variable arr7: std_logic_vector(7 downto 0):= "01000110";--F
    variable arr8: std_logic_vector(7 downto 0):= "01100111";--g
    variable arr9: std_logic_vector(7 downto 0):= "01000111";--G
    variable arr10: std_logic_vector(7 downto 0):= "01100001";--a
    variable arr11: std_logic_vector(7 downto 0):= "01000001";--A
    variable arr12: std_logic_vector(7 downto 0):= "01100010";--b
    variable arr13: std_logic_vector(7 downto 0):= "01000010";--B
    variable arr14: std_logic_vector(7 downto 0):= "01100011";--c
    variable arr15: std_logic_vector(7 downto 0):= "00011111";--#
    variable arr16: std_logic_vector(7 downto 0);

    
    
    --array <= "010000110110010001000100011001010100010101000110011001110100011101100001010000010110001001000010";
    
    variable array2: std_logic_vector(511 downto 0) :=(others =>'0');
    --variable array3: std_logic_vector(23 downto 0) :=(others =>'0');
    begin
        if RISING_EDGE(clk) then
            if a /= "00000000" and a /= "11111111" then 
                count := count+1;
                array1((511-(count-1)*8) downto (512-count*8))<=a;
                report "count"& integer'image(count);
                --data_valid <= '0';
            end if;
            if a = "00000000" then
                report "Endif1" ;
                while count1<=32 and array1((511-(count1-1)*8) downto (512-count1*8))/="00000000" loop
                    report "while loop mein" ;
                    report "count1"& integer'image(count1);
                    if array1((511-(count1-1)*8) downto (512-count1*8))=arr1 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr1;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "C";
                        report "count1 "& integer'image(count1);
                        report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr2 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr2;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "d";
                        report "count1"& integer'image(count1);
                        report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr3 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr3;
                        count1 := count1+1; 
                        count2 := count2+1;
                        report "D";  
                        report "count1"& integer'image(count1);
                        report "count2"& integer'image(count2); 
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr4 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr4;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "e";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr5 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr5;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "E";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr6 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr5;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "f";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr7 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr7;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "F";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr8 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr8;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "g";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr9 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr9;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "G";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr10 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr10;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "a";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr11 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr11;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "A";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr12 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr12;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "b";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr13 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr13;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "B";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr14 then 
                        array2((511-(count2-1)*8) downto (512-count2*8)):=arr13;
                        count1 := count1+1;
                        count2 := count2+1;
                        report "C";
                    report "count1"& integer'image(count1);
                      report "count2"& integer'image(count2);
                    elsif array1((511-(count1-1)*8) downto (512-count1*8))=arr15 then 
                        if array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr1 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr2;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr3 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr4;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr5 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr7;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr7 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr8;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr9 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr10;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr11 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr12;
                        elsif array2((511-(count2-2)*8) downto (512-(count2-1)*8))=arr13 then
                            array2((511-(count2-2)*8) downto (512-(count2-1)*8)):=arr1;
                        end if;
                        count1 := count1+1;
                    end if;
                    report "End of while loop";
                end loop;
                report "End of if 1";
                while array2((511-(count3-1)*8) downto (512-count3*8))/="00000000" loop
                      report "Entry of while";
                      report "count3"& integer'image(count3);
                      report "count5"& integer'image(count5);
                    while array2((511-(count3-1)*8) downto (512-count3*8))/=letter(count4) loop -- purpose to find element position in letter array
                        count4 := (count4+1) mod 12;
                        report "count4"& integer'image(count4);
                    end loop;
                    arrayout((511-(count5-1)*8) downto (512-count5*8)) <= letter(count4);
                    if letter((count4+4) mod 12) = array2((511-(count3+1-1)*8) downto (512-(count3+1)*8)) then -- first element 
                        if letter(((count4+4) mod 12 + 3) mod 12) = array2((511-(count3+2-1)*8) downto (512-(count3+2)*8)) then
                            if letter((((count4+4) mod 12 + 3) mod 12 + 3) mod 12) = array2((511-(count3+3-1)*8) downto (512-(count3+3)*8)) then
                                count5 := count5+1;
                                count3 := count3+4;
                                arrayout((511-(count5-1)*8) downto (512-count5*8)) <= "00110111";
                                count5 := count5+1;
                                count4:=0;
                                report "7";
                            else
                                count5 := count5+1;
                                count3 := count3+3;
                                arrayout((511-(count5-1)*8) downto (512-count5*8)) <= "01001101";
                                count5 := count5+1;
                                count4 := 0;
                                report "M";
                            end if;
                        else    
                            count5 := count5+1;
                            count3 := count3+1;
                            count4 := 0;
                            report "a";
                        end if;
                    elsif letter((count4+3) mod 12) = array2((511-(count3+1-1)*8) downto (512-(count3+1)*8)) then
                        if letter(((count4+3) mod 12 + 4) mod 12) = array2((511-(count3+2-1)*8) downto (512-(count3+2)*8)) then
                            count5 := count5+1;
                            count3 := count3+3;
                            arrayout((511-(count5-1)*8) downto (512-count5*8)) <= "01101101";
                            count5 := count5+1;
                            count4 := 0;
                            report "m";
                        
                        else    
                            count5 := count5+1;
                            count3 := count3+1;
                            count4 := 0;
                            report "b";
                        end if;
                    elsif letter((count4+5) mod 12) = array2((511-(count3+1-1)*8) downto (512-(count3+1)*8)) then
                        if letter(((count4+5) mod 12 + 2) mod 12) = array2((511-(count3+2-1)*8) downto (512-(count3+2)*8)) then
                            count5 := count5+1;
                            count3 := count3+3;
                            arrayout((511-(count5-1)*8) downto (512-count5*8)) <= "01110011";
                            count5 := count5+1;
                            count4 := 0;
                            report "s";
                        
                        else    
                            count5 := count5+1;
                            count3 := count3+1;
                            count4 := 0;
                            report "c";
                        end if;
                    else
                        count3:=count3+1;
                        count5:=count5+1;
                        count4:=0;
                        report "d";
                    end if;
                count := count+1;
                end loop;
                --output_process_bool <= '1';
                --data_valid <='0';
            end if;
            
            if a="11111111" then
                report "Output";
                if count6=1 then
                    z<="00000000";
                    count6:=count6+1;
                elsif arrayout((511-(count6-2)*8) downto (512-(count6-1)*8)) /="00000000" and count6<=32 then
                    z<=arrayout((511-(count6-2)*8) downto (512-(count6-1)*8));
                    count6 := count6+1;
                    report "count6"& integer'image(count6);
                --    data_valid <='1';
                else 
                    z<="00000000";
                end if;
            end if;
            
            
                
                
                
                
                --count6 := count6+1;
                --if count6 := 1 then
                --    arrayout((511-(count5-1)*8) downto (512-count5*8)) <= letter(count4);
                --    count5 := count5+1;
                --elsif count6 := 3 then 
                    
                
                
                
                --if prevcount := 0 then
                --    arrayout((511-(count5-1)*8) downto (512-count5*8)) <= letter(count4);
                --    count5 := count5+1;
                --    prevcount := count4;
                --elsif prevcount  then 
                
                --if count4 := '0' then
                --    arrayout((511-(count5-1)*8) downto (512-count5*8)) <= letter(count4 mod 12);
                --    count5:= count5+1;
                --prevcount := count4;
                --count3 := count3+1;
        
        end if;       
    end process;
end architecture;
    