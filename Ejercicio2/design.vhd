library IEEE;
use IEEE.std_logic_1164.all;


--Declaro un entidad global

entity Sumadorbits is
	port(
     	A 	: 	in  std_logic_vector(3 downto 0);
      	B	: 	in  std_logic_vector(3 downto 0);
        C_i	:  	in  std_logic;
      	S_o :  	out std_logic_vector(3 downto 0);
        C_o	:  	out std_logic
    	);
    end;

--La arquitectura de la entidad tendra 4 componentes del mismo tipo dentro (adder de 1 bit)

architecture Sumadorbits_tb of Sumadorbits is

signal A1,A2,A3	: std_logic;


--Componentes del tipo sumador
component adder is
port(
  	a_i : in std_logic;
  	b_i : in std_logic;
  	ci_i : in std_logic;
  	s_o : out std_logic;
  	co_o: out std_logic
	); 
end component;
  
begin

--Hago la conexion de los componentes a los vectores y signals
adder0:adder port map(	a_i => A(0),
						b_i => B(0),
                        ci_i => C_i,
                        s_o => S_o(0),
                        co_o => A1
                     );

adder1:adder port map(	a_i => A(1),
						b_i => B(1),
                        ci_i => A1,
                        s_o => S_o(1),
                        co_o => A2
                     );

adder2:adder port map(	a_i => A(2),
						b_i => B(2),
                        ci_i => A2,
                        s_o => S_o(2),
                        co_o => A3
                     );
                     
adder3:adder port map(	a_i => A(3),
						b_i => B(3),
                        ci_i => A3,
                        s_o => S_o(3),
                        co_o => C_o
                     );
end Sumadorbits_tb;
-- Termina la arquitectura del sumadorbits_tb

library IEEE;
use IEEE.std_logic_1164.all;

-- Declaro la entidad del componente adder de 1 bit
entity adder is

port(
  	a_i : in std_logic;
  	b_i : in std_logic;
  	ci_i : in std_logic;
  	s_o : out std_logic;
  	co_o: out std_logic
	);
    
end adder;

-- Arquitectura del sumador de 1 bit
architecture adder_arch of adder is

	signal C1,C2,C3,C4 	: std_logic;
    signal B1,B2,B3 	: std_logic;
    signal co_aux,s_aux	: std_logic;
    
begin
	
    C1 <= ci_i and co_aux;					-- AND's for s_o
    C2 <= a_i and co_aux;
    C3 <= b_i and co_aux;
    C4 <= a_i and b_i and ci_i;
    
    B1 <= a_i and ci_i;						-- AND's for co_o
    B2 <= a_i and b_i;
    B3 <= b_i and ci_i;
    
    s_aux <= C1 or C2 or C3 or C4; 			-- NOR's
    co_aux <= not (B1 or B2 or B3);
    
    co_o <= not co_aux;
    s_o  <= s_aux;
    
end adder_arch;
