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
	     clk             : in std_logic; 
	     rst             : in std_logic;
	     valid_code      : in std_logic;
	     scan_code_in    : in  unsigned(7 downto 0);
	     code_to_display : out unsigned(7 downto 0);
	     seg_en          : out unsigned(3 downto 0)
	 );
end keyboard_ctrl;

architecture keyboard_ctrl_arch of keyboard_ctrl is
type state_type is (s0,s1,s2);
signal current_state, next_state : state_type;
signal byte_to_save : unsigned(7 downto 0);
signal display_bar : unsigned(31 downto 0);
signal display_counter :unsigned(1 downto 0);
begin
 
    reg: process(clk,rst)
        begin
            if rst = '0' then
              seg_en          <= (others => '1');
              code_to_display <= (others => '0');
              display_bar     <= (others => '1');
           elsif rising_edge(clk) then
              current_state <= next_state;
            end if;
    end process reg;
 
     statemachine: process (valid_code,current_state)
     begin
        next_state <= current_state;
            case current_state is
            when s0 =>
                if valid_code = '1' and  scan_code_in = "11110000" then
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s1 =>
                if valid_code = '1' then
                   byte_to_save <= scan_code_in; 
                else
                    next_state <=s1;
                end if;
            when others => null;
            end case;
     end process statemachine;
     
     --proceso de secuencia
     sequence: process(byte_to_save)
     begin
     display_bar <= display_bar(31 downto 8) & byte_to_save;
     case display_counter is
     when "00" =>
     code_to_display <= display_bar(7 downto 0);
     display_counter <= "01";
     when "01" =>
     code_to_display <= display_bar(15 downto 8);
     display_counter <= "10";
     when "10" =>
     code_to_display <= display_bar(23 downto 16);
     display_counter <= "11";
     when "11" =>
     code_to_display <= display_bar(31 downto 24);
     display_counter <= "00";
     when others => null;
     end case;
     end process sequence;
end keyboard_ctrl_arch;
