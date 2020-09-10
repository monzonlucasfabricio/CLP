library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de la entidad

entity sumNb is
    generic(
            N: natural := 4
    );
    port(
        a_i : in std_logic_vector(N-1 downto 0);
        b_i : in std_logic_vector(N-1 downto 0);
        ci_i: in std_logic;
        s_o : out std_logic_vector(N-1 downto 0);
        co_o: out std_logic;
    );
end;

architecture sumNb_tb of sumNb is

    signal aux: std_logic_vector(N+1 downto 0)

begin

    -- Parte descriptiva

    aux <= std_logic_vector(unsigned('0' & a_i & ci_i) + ('0' & b_i & '1'));
    s_o <= aux(N downto 1);
    co_o <= aux(N+1);

end sumNb_tb ; -- sumNb_tb
