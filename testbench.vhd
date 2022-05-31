library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity TopLevel_entity_tb is
end TopLevel_entity_tb;

architecture bench of TopLevel_entity_tb is

	component TopLevel_entity
		port (
			POIN : IN STD_LOGIC_vector (1 downto 0);
			CLK, RST : IN STD_LOGIC;
			seven_segment_1_X	: out std_logic_vector (6 downto 0);
			seven_segment_2_X	: out std_logic_vector (6 downto 0);
			seven_segment_1_Y	: out std_logic_vector (6 downto 0);
			seven_segment_2_Y	: out std_logic_vector (6 downto 0);
			POSISI_X, POSISI_Y, SERVX, SERVY : OUT STD_LOGIC_vector (1 downto 0)
		);
	end component;
	
	constant T       : time    := 20 ns;
	constant max_clk : integer := 43;
	constant count   : integer := 0;
	signal i         : integer := 0;
		
	signal POIN: STD_LOGIC_vector (1 downto 0);
	signal CLK, RST: STD_LOGIC;
	signal seven_segment_1_X: std_logic_vector (6 downto 0);
	signal seven_segment_2_X: std_logic_vector (6 downto 0);
	signal seven_segment_1_Y: std_logic_vector (6 downto 0);
	signal seven_segment_2_Y: std_logic_vector (6 downto 0);
	signal POSISI_X, POSISI_Y, SERVX, SERVY: STD_LOGIC_vector (1 downto 0) ;

begin

	uut: TopLevel_entity port map (POIN, CLK, RST, seven_segment_1_X, seven_segment_2_X, seven_segment_1_Y, seven_segment_2_Y, POSISI_X, POSISI_Y, SERVX, SERVY);
									
	clock_process: process
	begin
		if (i < max_clk) then i <= i + 1;
		CLK <= '1';
		wait for T/2;
		CLK <= '0';
		wait for T/2;
		i <= i + 1;
		else wait;
		end if;
	end process;
	
	RST <= '1', '0' after T/2;
 
stimulus: process
 
	begin
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(1) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(2) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(3) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(4) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(5) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(6) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(7) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(8) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(9) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(10) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(11) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(12) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(13) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(14) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(15) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(16) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(17) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(18) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(19) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(20) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(21) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(22) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(23) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(24) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(25) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(26) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(27) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(28) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(29) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "10" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(30) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(31) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(32) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(33) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "00" and SERVY = "01")
		report "tes gagal pada testbench " & integer'image(34) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(35) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(36) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(37) severity error;
		POIN <= "10";
		wait for T;
		assert(POSISI_X = "01" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(38) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(39) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "01" and SERVY = "00")
		report "tes gagal pada testbench " & integer'image(40) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(41) severity error;
		POIN <= "01";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "01" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(42) severity error;
		POIN <= "00";
		wait for T;
		assert(POSISI_X = "10" and POSISI_Y = "10" and SERVX = "00" and SERVY = "10")
		report "tes gagal pada testbench " & integer'image(43) severity error;
	  
		wait;
end process;
		
end bench;