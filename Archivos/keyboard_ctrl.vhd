-------------------------------------------------------------------------------
-- Title      : keyboard_ctrl.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        controller to handle the scan codes 
-- 		        
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity keyboard_ctrl is
    port (
	     clk : in std_logic; 
	     rst : in std_logic;
	     valid_code : in std_logic;
	     scan_code_in : in unsigned(7 downto 0);
	     code_to_display : out unsigned(7 downto 0);
	     seg_en : out unsigned(3 downto 0)
	 );
end keyboard_ctrl;

architecture keyboard_ctrl_arch of keyboard_ctrl is

begin
 
reg:process(clk,rst)
    begin
        if rst = '0' then
            seg_en          <= (others => '1');
            code_to_display <= (others => '0');
        elsif clk'event and clk = '1' then
                 
        end if;
    end process reg;
 
 convertor: process (scan_code_in)
 begin
 end process convertor;
 
 
end keyboard_ctrl_arch;
