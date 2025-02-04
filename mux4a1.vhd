library IEEE;
use IEEE.std_logic_1164.all;

entity mux4a1 is
    port (
        d: in  std_logic_vector(3 downto 0);
        s: in std_logic_vector(1 downto 0);
        y: out std_logic
    );
end mux4a1;

architecture synth of mux4a1 is
    
begin
    process(d, s)
    begin
        case s is
            when "00" => y <= d(0);
            when "01" => y <= d(1);
            when "10" => y <= d(2);
            when "11" => y <= d(3);
        end case;
    end process;
end;