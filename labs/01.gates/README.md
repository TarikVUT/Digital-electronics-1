# 01-Gates
## The Lab exercise 1
### DeMorgan's Laws
[Link : xalkan02 Digital-electronics-1](https://github.com/TarikVUT/Digital-electronics-1)



* * Code in VHDL* *
[Link for VHDL code in **EDA playgraound**](https://www.edaplayground.com/x/CT3M)
``` VHDL
library ieee;                  -- Standard library
use ieee.std_logic_1164.all;   -- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i     : in  std_logic;          -- Data input
        b_i     : in  std_logic;  	    	-- Data input
        c_i     : in  std_logic;          -- Data input
        F_o     : out std_logic;          -- OR output function
        Fnand_o : out std_logic;          -- AND output function
       Fnor_o   : out std_logic            -- XOR output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    F_o     <= (a_i and (not b_i)) or ((not b_i) and (not c_i));
    Fnand_o <= not(not(a_i and (not b_i)) and (not((not b_i) and not(c_i))));
   Fnor_o   <= (not((not (a_i) nor b_i) nor (b_i nor c_i)));

end architecture dataflow;

```
### All functions we used 
| **C** | **B** |**A** |**F** |**F NAND**|**F NOR**|
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |





