
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
### *Design.vhd*
***VHDL architecture from source file mux_2bit_4to1.vhd***
``` vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 - 1 downto 0);
		b_i           : in  std_logic_vector(2 - 1 downto 0);
		c_i           : in  std_logic_vector(2 - 1 downto 0);
		d_i           : in  std_logic_vector(2 - 1 downto 0);
		sel_i         : in  std_logic_vector(2 - 1 downto 0);
		
        f_o           : out std_logic_vector(2 - 1 downto 0)     
    );

end mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin
       f_o <= a_i when (sel_i = "00" ) else
              b_i when (sel_i = "01" ) else
              c_i when (sel_i = "10" ) else
              d_i;

end Behavioral;

```
### *Testbench.vhd*
***VHDL stimulus process from testbench file tb_mux_2bit_4to1.vhd***

``` vhdl
brary ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_mux_2bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_2bit_4to1;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_mux_2bit_4to1 is

    -- Local signals
    signal s_a       : std_logic_vector(2 - 1 downto 0);
    signal s_b       : std_logic_vector(2 - 1 downto 0);
    signal s_c       : std_logic_vector(2 - 1 downto 0);
    signal s_d       : std_logic_vector(2 - 1 downto 0);
    signal s_sel     : std_logic_vector(2 - 1 downto 0);
    signal s_f       : std_logic_vector(2 - 1 downto 0);

begin
    uut_comparator_2bit : entity work.mux_2bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            sel_i         => s_sel,
            f_o           => s_f
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_d <= "00"; s_c <= "00";s_b <= "00"; s_a <= "00";
        s_sel <= "00";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "00";
        s_sel <= "00";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "11";
        s_sel <= "00";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "00";
        s_sel <= "01";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "11"; s_a <= "00";
        s_sel <= "01";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "11"; s_a <= "00";
        s_sel <= "10";wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "11"; s_a <= "00";
        s_sel <= "11";wait for 100ns;
        
        s_d <= "11"; s_c <= "01";s_b <= "11"; s_a <= "01";
        s_sel <= "01";wait for 100ns;
        
        s_d <= "11"; s_c <= "11";s_b <= "11"; s_a <= "11";
        s_sel <= "00";wait for 100ns;
        
        s_d <= "01"; s_c <= "01";s_b <= "11"; s_a <= "10";
        s_sel <= "10";wait for 100ns; 
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;

```
***simulation***\
![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/10.PNG)
## ***(3)***

After open program vivado ,click on ***Create new project*** then \
add **project name.**\
choose **project location.**\
click **Next**
![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/2.PNG)

![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/3.PNG)
For **project type** ,choose ***RTL***. \
Click **Next**

![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/4.PNG)
Change **Target language**and **Simulator language** to ***VHDL***. \
Click on **create File**. \
File type ->***VHDL*** \
Add **File Name**. \
Click **Ok** then **Next**
![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/5.PNG)

![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/6.PNG)

![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/7.PNG)

![](https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/03.vivado/images/8.png)

![]()

![]()


