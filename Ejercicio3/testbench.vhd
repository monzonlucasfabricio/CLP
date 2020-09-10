-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity Sumrest_tb is
end Sumrest_tb;

architecture Sumresttb_tb of Sumrest_tb is

component Sumrest is
	port(
     	A_sr_i : in  std_logic_vector(3 downto 0);
      	B_sr_i : in  std_logic_vector(3 downto 0);
        R_sr_i : in  std_logic;
        S_sr_o : out std_logic_vector(3 downto 0)
    	);
    end component;
    
signal A_tb 	: std_logic_vector(3 downto 0) := (others => '0');
signal B_tb	 	: std_logic_vector(3 downto 0) := (others => '0');
signal S_tb	 	: std_logic_vector(3 downto 0);
signal R_tb 	: std_logic;

begin

	DUT: Sumrest
    		port map(
            		A_sr_i => A_tb,
                    B_sr_i => B_tb,
                    R_sr_i => R_tb,
                    S_sr_o => S_tb
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
   		B_tb <= "0111";
   		wait for 100 ns;
   		B_tb <= "0011";
   		wait;
   end process;
   
   steam_proc_R: process
   begin
   		R_tb <= '1';
   		wait for 100 ns;
   		wait;
   end process;

end;
