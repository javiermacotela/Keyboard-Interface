-------------------------------------------------------------------------------
-- Title      : edge_detector.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Make sure not to use 'EVENT on anyother signals than clk
-- 		        
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity edge_detector is
    port (
	     clk : in std_logic;
	     rst : in std_logic;
	     kb_clk_sync : in std_logic;
	     edge_found : out std_logic
	 );
end edge_detector;


architecture edge_detector_arch of edge_detector is
    signal kb_clk_sync_past:STD_LOGIC;
begin
    process(clk,rst)
    begin
        if clk= '1' and clk'event then
            if rst = '1' then
                        kb_clk_sync_past<= '0';
            end if;  
        else 
             kb_clk_sync_past <= kb_clk_sync;          
        end if;
    end process;
    edge_found<= kb_clk_sync_past and (not kb_clk_sync); 
end edge_detector_arch;
