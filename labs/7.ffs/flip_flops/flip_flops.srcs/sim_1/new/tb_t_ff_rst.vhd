----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 09:49:19 PM
-- Design Name: 
-- Module Name: tb_t_ff_rst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_t_ff_rst is
--  Port ( );
end tb_t_ff_rst;

architecture Behavioral of tb_t_ff_rst is

 constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
 
 signal  s_clk           : STD_LOGIC; 
 signal  s_rst           : STD_LOGIC; 
 signal  s_t             : STD_LOGIC;
 signal  s_q             : STD_LOGIC; 
 signal  s_q_bar         : STD_LOGIC;
begin
  uut_t_ff_rst : entity work.t_ff_rst
  port map (
         clk       => s_clk,
         t         => s_t,
         rst       => s_rst,
         q         => s_q,
         q_bar     => s_q_bar
            );

-------------------- Clock generation process --------------------------
 p_clk_gen : process
      begin 
         while now < 750ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
  end process p_clk_gen;
 ----------------- Reset generation process -----------------------------
       p_reset_gen : process
  
    begin
        s_rst <= '0';                 -- Reset deactivated
        wait for 60 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 60 ns;
        s_rst <= '0';                 -- Reset deactivated
        wait;
  end process p_reset_gen;
       
       p_stimulus : process
   
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started." severity note;
       s_t     <=  '0';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 1" severity note;
        
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 2" severity note;
        
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 3" severity note;
       
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 4" severity note;
           
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 5" severity note;
        
         s_t     <=  '1';
        wait for 10ns;
        assert (s_q = 'U' and s_q_bar = 'U') report "Error 6" severity note;
        
        ----------------------  Reset activated  -------------------------
        
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 7" severity note;
        
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 8" severity note;
        
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 9" severity note;
       
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 10" severity note;
           
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 11" severity note;
        
         s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 12" severity note;
         s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 13" severity note;
        
        ----------------------------  Reset deactivated  --------------------------
        
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 14" severity note;
        
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 15" severity note;
       
        s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 16" severity note;
           
        s_t     <=  '0';
        wait for 10ns;
        assert (s_q = '0' and s_q_bar = '1') report "Error 17" severity note;
        
         s_t     <=  '1';
        wait for 10ns;
        assert (s_q = '1' and s_q_bar = '0') report "Error 18" severity note;
        
        wait for 20 ns;
        
        report "Stimulus process ended." severity note;
        wait;
   end process p_stimulus;
       
end Behavioral;
