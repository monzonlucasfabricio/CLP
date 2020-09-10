LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

-- Declaracion de la entidad
ENTITY sumNb_tb IS
END;
ARCHITECTURE sumNb_tb OF sumNb IS

    COMPONENT sumNb IS
        GENERIC (
            N : NATURAL := 4
        );
        PORT (
            a_i : IN std_logic_vector(N - 1 DOWNTO 0);
            b_i : IN std_logic_vector(N - 1 DOWNTO 0);
            ci_i : IN std_logic;
            s_o : OUT std_logic_vector(N - 1 DOWNTO 0);
            co_o : OUT std_logic;
        );
    END COMPONENT;
    CONSTANT N_tb : NATURAL := '0';
    SIGNAL a_tb : std_logic_vector(N_tb - 1 DOWNTO 0) := (N_tb - 1 DOWNTO 0 => '0');
    SIGNAL b_tb : std_logic_vector(N_tb - 1 DOWNTO 0) := (N_tb - 1 DOWNTO 0 => '0');
    SIGNAL ci_tb : std_logic := '0';
    SIGNAL s_tb : std_logic_vector(N_tb - 1 DOWNTO 0) := (N_tb - 1 DOWNTO 0 => '0');
    SIGNAL co_tb : std_logic := '0';
BEGIN

    -- Parte descriptiva

    a_tb <= std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns,
        std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns;
    b_tb <= std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns,
        std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns;
    ci_tb <= std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns,
        std_logic_vector(to_unsigned(7, N_tb)) AFTER 50 ns;

    DUT : sumNb
    GENERIC MAP(
        N => N_tb
    )
    PORT MAP(
        a_i => a_tb;
        b_i => b_tb;
        ci_i => ci_tb;
        s_o => s_tb;
        co_o => co_tb
    );

END sumNb_tb; -- sumNb_tb