-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity Sumadorbits_tb is
end Sumadorbits_tb;

architecture adder_tb of Sumadorbits_tb is

component Sumadorbits is
	port(
     	A 	: 	in  std_logic_vector(3 downto 0);
      	B	: 	in  std_logic_vector(3 downto 0);
        C_i	:  	in  std_logic;
      	S_o :  	out std_logic_vector(3 downto 0);
        C_o	:  	out std_logic
    	);
    end component;
    
signal A_tb 	: std_logic_vector(3 downto 0) := (others => '0');
signal B_tb	 	: std_logic_vector(3 downto 0) := (others => '0');
signal Ci_tb 	: std_logic := '0';
signal S_tb	 	: std_logic_vector(3 downto 0);
signal Co_tb 	: std_logic;

begin


	DUT: Sumadorbits
    		port map(
            		A => A_tb,
                    B => B_tb,
                    C_i => Ci_tb,
                    S_o => S_tb,
                    C_o => Co_tb
            		);
   steam_proc_A: process
   begin
   		A_tb <= "0100";
   		wait for 100 ns;
   		A_tb <= "0111";
   		wait;
   end process;
   
   
   steam_proc_B: process
   begin
   		B_tb <= "1111";
   		wait for 100 ns;
   		B_tb <= "0011";
   		wait;
   end process;
   
   steam_proc_C: process
   begin
   		Ci_tb <= '0';
   		wait for 100 ns;
   		wait;
   end process;

end;
