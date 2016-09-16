-------------------------------------------------------------------------------
-- Title      : convert_to_binary.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Look-up-Table
-- 		
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity convert_to_binary is
    port (
	     scan_code_in : in unsigned(7 downto 0);
	     binary_out : out unsigned(3 downto 0)
	 );
end convert_to_binary;

architecture convert_to_binary_arch of convert_to_binary is
begin
    process(scan_code_in)
    begin 
        case scan_code_in is
                when "01000101" => binary_out <= "0000";
                when "00010110" => binary_out <= "0001";
                when "00011110" => binary_out <= "0010";
                when "00100110" => binary_out <= "0011";
                when "00100101" => binary_out <= "0100";
                when "00101110" => binary_out <= "0101";
                when "00110110" => binary_out <= "0110";
                when "00111101" => binary_out <= "0111";
                when "00111110" => binary_out <= "1000";
                when "01000110" => binary_out <= "1001";
                when others => binary_out <= "1111";
            end case;
    end process;
-- simple combinational logic using case statements (LUT) 

end convert_to_binary_arch;
