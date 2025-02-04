library IEEE;
use IEEE.std_logic_1164.all;

entity decodeur2a4 is
    port(
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic_vector(3 downto 0)
    );
end decodeur2a4;

architecture sequential of decodeur2a4 is
begin
    process(S)
    begin
        case S is
            when "00" =>
                Y <= "0001";
            when "01" =>
                Y <= "0010";
            when "10" =>
                Y <= "0100";
            when "11" =>
                Y <= "1000";
        end case;
    end process;
end;