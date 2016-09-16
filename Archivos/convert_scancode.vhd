-------------------------------------------------------------------------------
-- Title      : convert_scancode.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Implement a shift register to convert serial to parallel
-- 		        A counter to flag when the valid code is shifted in
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity convert_scancode is
    port (
	     clk : in std_logic;
	     rst : in std_logic;
	     edge_found : in std_logic;
	     serial_data : in std_logic;
	     valid_scan_code : out std_logic;
	     scan_code_out : out unsigned(7 downto 0)
	 );
end convert_scancode;

architecture convert_scancode_arch of convert_scancode is
signal tmp_in,tmp_q: std_logic_vector(10 downto 0);
signal count_in,count_q: unsigned(3 downto 0);
begin
    reg  :process(clk,rst)
    begin
        if rst = '0' then
            count_q <= (others => '0');
            tmp_q <= (others => '0');
        elsif clk'event and clk = '1' then
            tmp_q <= tmp_in;
            count_q <= count_in;       
        end if;
    end process reg;
    
    tmp_in <=  tmp_q(9 downto 0) & serial_data when edge_found ='1' else tmp_q;
    
    validstate :process(count_q, edge_found)
    begin
    count_in <= count_q;
    valid_scan_code <= '0';
    if edge_found = '1' then
        count_in <= count_q + 1;
        if count_q = "10111" then
            valid_scan_code <= '1';
            count_in <= "0000";  
        end if;
     end if;
    end process validstate; 
    
    scan_code_out <= unsigned( tmp_q(8 downto 1));
    
end convert_scancode_arch;
