library ieee;
use ieee.std_logic_1164.all;

entity TopLevel_entity is
	port (
		POIN : IN STD_LOGIC_VECTOR (1 downto 0);
		CLK, RST : IN STD_LOGIC;
		seven_segment_1_X	: out std_logic_vector (6 downto 0);
		seven_segment_2_X	: out std_logic_vector (6 downto 0);
		seven_segment_1_Y	: out std_logic_vector (6 downto 0);
		seven_segment_2_Y	: out std_logic_vector (6 downto 0);
		POSISI_X, POSISI_Y, SERVX, SERVY : OUT STD_LOGIC_VECTOR (1 downto 0)
	);
end TopLevel_entity;

architecture main_arch of TopLevel_entity is

	component counter_1 is 
		port (
			clock			: in std_logic;
			reset			: in std_logic;
			count			: in std_logic;
			seven_segment_1	: out std_logic_vector (6 downto 0);
			seven_segment_2	: out std_logic_vector (6 downto 0)
		);
	end component;

	component servisX is
		port(
		--signal untuk clock dan reset
		CLK, RST : IN STD_LOGIC;
		
		-- signal untuk menentukan poin
		-- 10 : Poin untuk team X
		-- 01 : Pon untuk team Y
		POIN : IN STD_LOGIC_VECTOR (1 downto 0);
		
		--signal untuk menentukan posisi pemain di lapangan dan pemain mana yang berhak melakukan servisX
		POSISI, SERVX : OUT STD_LOGIC_VECTOR (1 downto 0)
	);
	end component;

	component servisY is
		port(
		--signal untuk clock dan reset
		CLK, RST : IN STD_LOGIC;
		
		-- signal untuk menentukan poin
		-- 10 : Poin untuk team X
		-- 01 : Pon untuk team Y
		POIN : IN STD_LOGIC_VECTOR (1 downto 0);
		
		--signal untuk menentukan posisi pemain di lapangan dan pemain mana yang berhak melakukan servis
		POSISI, SERVY : OUT STD_LOGIC_VECTOR (1 downto 0)
	);
	end component;
	
	signal poin_x	: std_logic;
	signal poin_y	: std_logic;
	
begin
	poin_x <= poin(1);
	poin_y <= poin(0);
	FSM_X	: servisX port map (CLK, RST, POIN, POSISI_X, SERVX);
	FSM_Y	: servisY port map (CLK, RST, POIN, POSISI_Y, SERVY);
	score_X	: counter_1 port map (CLK, RST, poin_x, seven_segment_1_X, seven_segment_2_X);
	score_Y	: counter_1 port map (CLK, RST, poin_y, seven_segment_1_Y, seven_segment_2_Y);
	
end main_arch;