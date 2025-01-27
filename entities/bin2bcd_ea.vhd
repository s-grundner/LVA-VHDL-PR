library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.std_definitions.all;

entity bin2bcd is
	port (
		binary_i        : in   std_ulogic_vector  (15 downto 0);
		ones_o          : out  std_ulogic_vector   (3 downto 0);
		tens_o          : out  std_ulogic_vector   (3 downto 0);
		hundreds_o      : out  std_ulogic_vector   (3 downto 0);
		thousands_o     : out  std_ulogic_vector   (3 downto 0);
		tenthousands_o  : out  std_ulogic_vector   (3 downto 0)
	);
end bin2bcd;

architecture rtl of bin2bcd is

begin

	encode_comb : process(binary_i)

		variable binary_to_shift : std_ulogic_vector (15 downto 0);
		variable bcd : std_ulogic_vector (19 downto 0) := (others => '0');
		
	begin
		bcd := (others => '0');
		binary_to_shift := binary_i;

		for i in 0 to 15 loop

			if unsigned(bcd(3 downto 0)) > to_unsigned(4,4) then 
				bcd(3 downto 0) := std_ulogic_vector(unsigned(bcd(3 downto 0)) + to_unsigned(3,4));
			end if;

			if unsigned(bcd(7 downto 4)) > to_unsigned(4,4) then 
				bcd(7 downto 4) := std_ulogic_vector(unsigned(bcd(7 downto 4)) + to_unsigned(3,4));
			end if;

			if unsigned(bcd(11 downto 8)) > to_unsigned(4,4) then  
				bcd(11 downto 8) := std_ulogic_vector(unsigned(bcd(11 downto 8)) + to_unsigned(3,4));
			end if;

			if unsigned(bcd(15 downto 12)) > to_unsigned(4,4) then  
				bcd(15 downto 12) := std_ulogic_vector(unsigned(bcd(15 downto 12)) + to_unsigned(3,4));
			end if;

			if unsigned(bcd(19 downto 16)) > to_unsigned(4,4) then  
				bcd(19 downto 16) := std_ulogic_vector(unsigned(bcd(19 downto 16)) + to_unsigned(3,4));
			end if;

			-- shift in MSB of binary_to_shift to bcd
			bcd := bcd(18 downto 0) & binary_to_shift(15);
			-- shift binary_to_shift left by 1 bit
			binary_to_shift := binary_to_shift(14 downto 0) & '0';

			-- set outputs
			ones_o <= std_ulogic_vector(bcd(3 downto 0));
			tens_o <= std_ulogic_vector(bcd(7 downto 4));
			hundreds_o <= std_ulogic_vector(bcd(11 downto 8));
			thousands_o <= std_ulogic_vector(bcd(15 downto 12));  
			tenthousands_o <= std_ulogic_vector(bcd(19 downto 16)); 
		end loop;
	end process encode_comb;       

end rtl;