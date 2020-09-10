-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaro una entidad vacia
entity Sumador_tb is
end;

architecture Sumador_tb_arq of Sumador_tb is

-- Parte declarativa

component Sumador is
	port(
    	a_i  :  in  std_logic;
        b_i  :  in  std_logic;
        ci_i :  in  std_logic;
        s_o  :  out std_logic;
        co_o :  out std_logic
    	);
	end component;
    
    signal a_tb : std_logic := '0';
    signal b_tb : std_logic := '0';
    signal c_tb : std_logic := '0';
    signal s_tb : std_logic;
    signal co_tb: std_logic;
    

begin

    --a_tb <= '1' after 1 ns, '0' after 2 ns, '1' after 5 ns;
    --b_tb <= '1' after 1 ns, '0' after 2 ns, '1' after 8 ns;
    --c_tb <= '1' after 1 ns, '0'	after 2 ns, '1' after 10 ns;
     
    a_tb <= not a_tb after 1 ns;
    b_tb <= not b_tb after 2 ns;
    c_tb <= not c_tb after 4 ns;
    
    DUT: Sumador
    	port map(
        	a_i	 => a_tb,
            b_i  => b_tb,
            ci_i => c_tb,
            s_o  => s_tb,
            co_o => co_tb
        );
end;
