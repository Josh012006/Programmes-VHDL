library IEEE;
use IEEE.std_logic_1164.all;


entity mealy is
    port (
        clk, reset: in std_logic;
        x: in std_logic;
        y: out std_logic
    );
end entity mealy;

architecture synth of mealy is
    type stateType is (s0, s1, s2, s3);
    signal currentState, nextState: stateType;
begin
    
    process(clk, reset)
    begin
        if reset = '1' then
            currentState <= s0;
        elsif clk'event and clk = '1' then
            currentState <= nextState;
        end if;
    end process;

    process(currentState, x)
    begin
        y <= '0';
        case currentState is
            when s0 => 
                nextState <= s1 when x = '1' else s0;
            when s1 =>
                nextState <= s2 when x = '1' else s0;
            when s2 =>
                nextState <= s2 when x = '1' else s3;
            when s3 => 
                nextState <= s1 when x = '1' else s0;
                if x = '1' then
                    y <= '1';
                end if;
            when others =>
                nextState <= s0; 
        end case;
    end process;
    
end;