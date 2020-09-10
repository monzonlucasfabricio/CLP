library IEEE;
use IEEE.std_logic_1164.all;


 --Declaracion de la identidad
entity Sumador is
	port(
    		a_i  :  in  std_logic;
            b_i  :  in  std_logic;
            ci_i :  in  std_logic;
            s_o  :  out std_logic;
            co_o :  out std_logic
    	);
    end;

architecture Sumador_tb of Sumador is

	signal A1,A2,A3,A4 	: std_logic;
    signal B1,B2,B3 	: std_logic;
    signal co_aux,s_aux	: std_logic;
    
begin
	
    A1 <= ci_i and co_aux;					-- AND's for s_o
    A2 <= a_i and co_aux;
    A3 <= b_i and co_aux;
    A4 <= a_i and b_i and ci_i;
    
    B1 <= a_i and ci_i;						-- AND's for co_o
    B2 <= a_i and b_i;
    B3 <= b_i and ci_i;
    
    s_aux <= A1 or A2 or A3 or A4; 			-- NOR's
    co_aux <= not (B1 or B2 or B3);
    
    co_o <= not co_aux;
    s_o  <= s_aux;

end;
