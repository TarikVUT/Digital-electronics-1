
# 7.ffs
[xalkan02 Digital-electronics-1 - 6.display_driver](https://github.com/TarikVUT/Digital-electronics-1/edit/main/labs/7.ffs/README.md) 

### 1.Preparation tasks
***Write characteristic equations and complete truth tables for D, JK, T flip-flops.**

 | **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | No Change |
   | 0 | 1 | 1 | Change |
   | 1 | 0 | 0 | No Change  |
   | 1 | 1 | 1 | Change |

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 | 0 | Reset |
   | 0 | 1 | 1 | 0 | Reset |
   | 1 | 0 | 1 | 1 | set |
   | 1 | 1 | 1 | 1 | set |
   | 1 | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 1 | 0 | Toggle |

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | No change |
   | 0 | 1 | 1 | No change |
   | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 0 | Toggle |

## 2.D latch
  ***(a).VHDL code of the process***`p_d_latch`
```vhdl
p_d_latch : process (d, arst,en)
begin
    if (arst = '1') then
        q     <= '0';
        q_bar <= '1';
    elsif(en ='1') then
        q     <=  d;
        q_bar <= not d;
      
    end if;
end process p_d_latch;
```
***(b). VHDL code of reset and stimulus processes from the testbench****`tb_d_latch.vhd`
```vhdl
p_reset_gen : process
begin
        s_arst <='0';   -- Reset deactivated
        wait for 50 ns;

        s_arst <='1';   -- Reset activated
        wait for 10 ns;
        
        s_arst <='0';   -- Reset deactivated
        wait for 108 ns;
        
        s_arst <='1';   -- Reset activated
          
end process p_reset_gen;

p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started." severity note;
        
        s_en    <=  '0';     -- Enable deactivated 
        s_d     <=  '1';
        wait for 10ns;  
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 1" severity note;      
        s_d     <=  '0';
        wait for 10ns;  
         assert (s_q = 'U' and s_q_bar = 'U') report "Error 2" severity note;              
        s_d     <=  '1';
        wait for 10ns;    
         assert (s_q = 'U' and s_q_bar = 'U') report "Error 3" severity note;          
        s_d     <=  '0';
        wait for 10ns;    
         assert (s_q = 'U' and s_q_bar = 'U') report "Error 4" severity note;            
        s_d     <=  '1';
        wait for 10ns;   
         assert (s_q = 'U' and s_q_bar = 'U') report "Error 5" severity note;           
        s_d     <=  '0';
        wait for 10ns;
         assert (s_q = '0' and s_q_bar = '1') report "Error 6" severity note;
      -----------------------------------------------------------------------------                   
        -- Test en = 1
        s_en    <=  '1';     -- Enable activated     
        s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 7" severity note;
      
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 8" severity note;
           
        s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 9" severity note;
        
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 10" severity note;
           
        s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 11" severity note;
        
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 12" severity note;
       -------------------------------------------------------------------------- 
         s_en    <=  '0';    -- Enable deactivated
        
         s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 13" severity note;
      
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 14" severity note;
           
        s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 15" severity note;
        
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 16" severity note;
           
        s_d     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 17" severity note;
        
        s_d     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 18" severity note;
        
       
       
        report "Stimulus process end." severity note;
        wait;
    end process p_stimulus;
```
***(c).simulated***
