
# 3.Vivado
[xalkan02 Digital-electronics-1](https://github.com/TarikVUT/Digital-electronics-1/tree/main/labs/02.logic)

### ***(1)***

***The table of 16 slide switches and 16 LEDs on Nexys A7 board***

| **Switch** | **Connection** | **Pin** | **LED** | **Connection** | **Pin** |
| :-: | :-: | :-: | :-: |:-: |:-: |
| SW0 | a_i[0] | J15 | LED0 | f_o[0] | H17 |
| SW1 | a_i[1] | L16 |LED1 | f_o[1] | K15 |
| SW2 | b_i[0] | M13 |LED2 | X | J13 |
| SW3 | b_i[1] | R15 |LED3 | X | N14 |
| SW4 | c_i[0] | R17 |LED4 | X | R18 |
| SW5 | c_i[1] | T18 |LED5 | X | V17 |
| SW6 | d_i[0] | U18 |LED6 | X | U17 |
| SW7 | d_i[1] | R13 |LED7 | X | U16 |
| SW8 | X  | T8 |LED8 | X | V16 |
| SW9 | X  | U8 |LED9 | X | T15 |
| SW10 | X  | R16 |LED10 | X | U14 |
| SW11 | X  | T13 |LED11 | X | T16 |
| SW12 | X  | H6 |LED12 | X | V15 |
| SW13 | X  | U12 |LED13 | X | V14 |
| SW14 | sel_i[0]  | U11 |LED14 | X | V12 |
| SW15 | sel_i[1]  | V10 |LED15 | X | V11 |
## ***(2)***


## ***(3)***
### Code in VHDL
### *Design.vhd*
``` VHDL

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------------------
entity comparator_2bit is
    port(
        a_i           : in  std_logic_vector(4 - 1 downto 0);
	    b_i           : in  std_logic_vector(4 - 1 downto 0);

       


        B_Greater_A_o    : out std_logic ;      -- B is greater than A
        B_Equals_A_o     : out std_logic ;      -- B is equals  A
        B_Less_A_o       : out std_logic        -- B is less than A
    );
end entity comparator_2bit;

------------------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of comparator_2bit is
begin
      B_Greater_A_o  <= '1' when (b_i > a_i) else '0';
      B_Equals_A_o   <= '1' when (b_i = a_i) else '0';
      B_Less_A_o     <= '1' when (b_i < a_i) else '0';

end architecture Behavioral;


```
### *Testbench.vhd*
```VHDL
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_comparator_2bit is
    -- Entity of testbench is always empty
end entity tb_comparator_2bit;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_comparator_2bit is

    -- Local signals
    signal s_a       : std_logic_vector(4 - 1 downto 0);
    signal s_b       : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_comparator_2bit : entity work.comparator_2bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
        --13 values

        -- 1
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0000" severity error;
        
        
         --  2
        s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0001" severity error;
        
        
         -- 3
        s_b <= "0000"; s_a <= "0010"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0010" severity error;
        
        
         -- 4
        s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0011" severity error;
        
        
         -- 5
        s_b <= "0000"; s_a <= "0100"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0100" severity error;
        
        
         -- 6
        s_b <= "0000"; s_a <= "0101"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0101" severity error;
        
        
         -- 7
        s_b <= "0000"; s_a <= "0111"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 0000, 0111" severity error;
        
         -- 8
        s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0001, 0000" severity error;
        
         -- 9
        s_b <= "0010"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0010, 0000" severity error;
         
         -- 10
        s_b <= "0011"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0011, 0000" severity error;
        
         -- 11
        s_b <= "0100"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0100, 0000" severity error;
        
         -- 12
        s_b <= "0101"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0101, 0000" severity error;
        
         -- 13
        s_b <= "0111"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        -- If false, then report an error
        report "Test failed for input combination: 0111, 0000" severity error;
        
       
        -- WRITE OTHER TEST CASES HERE


        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;


```
### Přihlašit chybu error
[Code in EDA playground](https://www.edaplayground.com/x/8Tj2)\
je to chyba v řadku čislo --8\
![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/02.logic/images/vhdl%206.PNG)

### ***Simulace***
![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/02.logic/images/vhdl%205.PNG)


