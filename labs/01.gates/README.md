
# The Lab exercise 1
### DeMorgan's Laws
[Link : xalkan02 Digital-electronics-1](https://github.com/TarikVUT/Digital-electronics-1/tree/main/labs/01.gates)


### All functions we used (c,b,a).

<a href="https://www.codecogs.com/eqnedit.php?latex=\begin{align*}&space;f(c,b,a)&space;=&~&space;\overline{b}\cdot&space;a&space;&plus;&space;\overline{c}\cdot&space;\overline{b}\\&space;f(c,b,a)_{\textup{NAND}}&space;=&(\overline{\overline{\overline{b}\cdot&space;a}).(\overline{\overline{c}\cdot&space;\overline{b}}})\\&space;f(c,b,a)_{\textup{NOR}}&space;=&(\overline{\overline{\overline{b}\&space;&plus;&space;a})&plus;(\overline{\overline{c}\&space;&plus;&space;\overline{b}}})\\&space;\end{align*}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;f(c,b,a)&space;=&~&space;\overline{b}\cdot&space;a&space;&plus;&space;\overline{c}\cdot&space;\overline{b}\\&space;f(c,b,a)_{\textup{NAND}}&space;=&(\overline{\overline{\overline{b}\cdot&space;a}).(\overline{\overline{c}\cdot&space;\overline{b}}})\\&space;f(c,b,a)_{\textup{NOR}}&space;=&(\overline{\overline{\overline{b}\&space;&plus;&space;a})&plus;(\overline{\overline{c}\&space;&plus;&space;\overline{b}}})\\&space;\end{align*}" title="\begin{align*} f(c,b,a) =&~ \overline{b}\cdot a + \overline{c}\cdot \overline{b}\\ f(c,b,a)_{\textup{NAND}} =&(\overline{\overline{\overline{b}\cdot a}).(\overline{\overline{c}\cdot \overline{b}}})\\ f(c,b,a)_{\textup{NOR}} =&(\overline{\overline{\overline{b}\ + a})+(\overline{\overline{c}\ + \overline{b}}})\\ \end{align*}" /></a>

**schema pomoci (NOT,AND,OR,NAND,NOR)**.

<img src="https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/01.gates/images/VHDL%203.png" /> 



***Code in VHDL***
[Link for VHDL code in **EDA playgraound**](https://www.edaplayground.com/x/CT3M)
``` VHDL
library ieee;                  -- Standard library
use ieee.std_logic_1164.all;   -- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i     : in  std_logic;            -- Data input
        b_i     : in  std_logic;  	    	-- Data input
        c_i     : in  std_logic;            -- Data input
        F_o     : out std_logic;            -- OR output function
        Fnand_o : out std_logic;            -- AND output function
       Fnor_o   : out std_logic             -- XOR output function
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


***Tabulka***\
**Na tabulce vidime že ty tři funkce maji stejny vystup**

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

***VHDL simulation***
<img src="https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/01.gates/images/VHDL%201.png" /> 

# Experiments on your own
```
    x.y + x.z = x.(y + z)
   (x + y).(x + z) = x+(y . z)
  ```




[Link for VHDL code in **EDA playgraound**](https://www.edaplayground.com/x/ZcZH)
### VHDL code
```VHDL
library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations 

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        x_i     : in  std_logic;           -- Data input
        y_i     : in  std_logic;  		   -- Data input
        z_i     : in  std_logic;           -- Data input
        F1_o     : out std_logic;          -- OR output function
        F2_o     : out std_logic;          -- AND output function
        F3_o     : out std_logic;          -- XOR output function
        F4_o     : out std_logic           -- AND output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
 F1_o <= (x_i and y_i) or (x_i and z_i);
 F2_o <=  x_i and (y_i or z_i);
 F3_o <= (x_i or y_i) and (x_i or z_i);
 F4_o <= (x_i) or (y_i and z_i);
end architecture dataflow;

```
***VHDL simulation***
<img src="https://github.com/TarikVUT/Digital-electronics-1/blob/main/labs/01.gates/images/VHDL%202.png" /> 
```
Z obrazku vidime že F1 = F2 , taky F3 = F4 .
