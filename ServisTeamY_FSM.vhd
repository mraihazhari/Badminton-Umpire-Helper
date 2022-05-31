library ieee;
use ieee.std_logic_1164.all ;



entity servisY is

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

end servisY;


architecture arch_servY of servisY is 
	--state dari FSM
	type state_types is (ST6, ST0, ST1, ST2, ST3, ST4, ST5,ST7);
	signal present_state, next_state : state_types;
	--kondisi dari FSM dalam biner
	signal kondisi : std_logic_vector (2 downto 0);
begin
	
	sync_proc : process(CLK, next_state, RST)
	begin
	--jika reset bernilai 1 maka akan dikembalikan ke ST0 sebagai kondisi default memulai match
		if(RST = '1') then
			present_state <= ST6;
		elsif(rising_edge(CLK)) then 
			present_state <= next_state;
		end if;
	end process sync_proc;
	
	comb_proc : process(present_state, POIN)
	begin
	--Output di set ke angka 00 untuk mencegah bug
		SERVY <= "00";
		POSISI <= "00";
		
		case present_state is
		--Assign kondisi sesuai dengan FSM
		--Keterangan SERVX
		--10 = Pemain C berhak melakukan servis
		--01 = Pemain D berhak melakukan servis
		--00 = Pemain team Y tidak berhak melakukan servis
		--Keterangan Posisi
		-- 01 = Pemain C dikanan, Pemain D dikiri
		-- 10 = Pemain C dikiri, Pemain D dikanan
			when ST6 =>
					kondisi <= "011";
					SERVY <= "00";
					POSISI <= "01";
					--Jika team Y mendapat poin
					if(POIN = "01") then
						next_state <= ST4;
					--jika team X mendapat point
					elsif(POIN = "10") then
						next_state <= ST6;
					--kondisi hold
					else 
						next_state <= ST6;
					end if;
			when ST0 =>
				kondisi <= "101";
				SERVY <= "10";
				POSISI <= "01";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST1;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST6;
				--kondisi hold
				else 
					next_state <= ST0;
				end if;
			when ST1 =>
				kondisi <= "100";
				SERVY <= "10";
				POSISI <= "10";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST0;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST7;
				--kondisi hold
				else 
					next_state <= ST1;
				end if;
			when ST2 =>
				kondisi <= "000";
				SERVY <= "00";
				POSISI <= "10";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST1;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST2;
				--kondisi hold
				else 
					next_state <= ST2;
				end if;
			when ST3 =>
				kondisi <= "110";
				SERVY <= "01";
				POSISI <= "10";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST4;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST2;
				--kondisi hold
				else 
					next_state <= ST3;
				end if;
			when ST4 =>
				kondisi <= "111";
				SERVY <= "01";
				POSISI <= "01";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST3;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST5;
				--kondisi hold
				else 
					next_state <= ST4;
				end if;
			when ST5 =>
				kondisi <= "001";
				SERVY <= "00";
				POSISI <= "01";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST0;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST5;
				--kondisi hold
				else 
					next_state <= ST5;
				end if;
			
			when ST7 =>
				kondisi <= "010";
				SERVY <= "00";
				POSISI <= "10";
				--Jika team Y mendapat poin
				if(POIN = "01") then
					next_state <= ST3;
				--jika team X mendapat point
				elsif(POIN = "10") then
					next_state <= ST7;
				--kondisi hold
				else 
					next_state <= ST7;
				end if;
			end case;
	end process comb_proc;
end arch_servY;