-------------------------------------------------------------------------------
-- Title      : binary_to_sg.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 	            Simple Look-Up-Table	
-- 		
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity binary_to_sg is
    port (
	     binary_in : in unsigned(3 downto 0);
	     sev_seg   : out unsigned(7 downto 0)
	 );
end binary_to_sg;

architecture binary_to_sg_arch of binary_to_sg is
begin

    process(binary_in)
    begin
        case binary_in is
            when "0000" => sev_seg <= "00000001";
            when "0001" => sev_seg <= "01001111";
            when "0010" => sev_seg <= "00010010";
            when "0011" => sev_seg <= "00000110";
            when "0100" => sev_seg <= "01001100";
            when "0101" => sev_seg <= "00100100";
            when "0110" => sev_seg <= "00100000";
            when "0111" => sev_seg <= "00001111";
            when "1000" => sev_seg <= "00000000";
            when "1001" => sev_seg <= "00000100";
            when others => sev_seg <= "00110000";
        end case;
    end process;


end binary_to_sg_arch;
