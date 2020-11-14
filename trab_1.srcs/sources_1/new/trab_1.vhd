  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trab_1 is
    port(
        clk         : in  std_logic;
        led4        : out std_logic;
        led5        : out std_logic;
        led6        : out std_logic;
        led7        : out std_logic;
        btn0        : in  std_logic;
        btn1        : in  std_logic;
        btn2        : in  std_logic;
        btn3        : in  std_logic;
        switch0     : in  std_logic;
        switch1     : in  std_logic;
        led0_b      : out std_logic;
        led0_g      : out std_logic;
        led0_r      : out std_logic;
        led1_b      : out std_logic;
        led1_g      : out std_logic;
        led1_r      : out std_logic
    );
end trab_1;

architecture Behavioral of trab_1 is
    constant divider_c : integer := 100000000;
    constant divider_l4 : integer := 25000000;
    constant divider_l5 : integer := 50000000;
    constant divider_l6 : integer := 75000000;
    
    signal led_4 : std_logic := '0';
    signal led_5 : std_logic := '0';
    signal led_6 : std_logic := '0';
    signal led_7 : std_logic := '0';
    signal led0_r_s : std_logic := '0';
    signal led0_g_s : std_logic := '0';
    signal led0_b_s : std_logic := '0';
    signal led1_r_s : std_logic := '0';
    signal led1_g_s : std_logic := '0';
    signal led1_b_s : std_logic := '0';
    signal cnt_s : integer range 0 to divider_c := 0;
begin
    led4 <= led_4;
    led5 <= led_5;
    led6 <= led_6;
    led7 <= led_7;
    led0_r <= led0_r_s;
    led0_g <= led0_g_s;
    led0_b <= led0_b_s;
    led1_r <= led1_r_s;
    led1_g <= led1_g_s;
    led1_b <= led1_b_s;
    
    process(clk)
    begin
        -- cascata
        if (switch0 = '1') and (switch1 = '1') then
            led0_r_s <= '1'; led0_g_s <= '1'; led0_b_s <= '1';
            led1_r_s <= '1'; led1_g_s <= '1'; led1_b_s <= '1';
            if rising_edge(clk) then
                cnt_s <= cnt_s +1;
            
            if (cnt_s = divider_l4) then
                cnt_s <= divider_l4 + 1;
                led_4 <= '1';
                led_5 <= '0';
                led_6 <= '0';
                led_7 <= '0';
            end if;
            if (cnt_s = divider_l5) then
                cnt_s <= divider_l5 + 1;
                led_4 <= '0';
                led_5 <= '1';
                led_6 <= '0';
                led_7 <= '0';
            end if;
            if (cnt_s = divider_l6) then
                cnt_s <= divider_l6 + 1;
                led_4 <= '0';
                led_5 <= '0';
                led_6 <= '1';
                led_7 <= '0';
            end if;
            if (cnt_s = divider_c) then
                cnt_s <= 0;
                led_4 <= '0';
                led_5 <= '0';
                led_6 <= '0';
                led_7 <= '1';
            end if;
            end if;
        end if;
        if (switch0 = '0') or (switch1 = '0') then
            led_4 <= '0';
            led_5 <= '0';
            led_6 <= '0';
            led_7 <= '0';     
        end if; 
        -- leds normais
        if (switch0 = '0') and (switch1 = '0') then
            led_4 <= btn0;
            led_5 <= btn1;
            led_6 <= btn2;
            led_7 <= btn3;
            led0_r_s <= '0'; led0_g_s <= '0'; led0_b_s <= '0';
            led1_r_s <= '0'; led1_g_s <= '0'; led1_b_s <= '0';
        end if;
        -- vermelho
        if (switch0 = '1') and (switch1 = '0') then
            led0_r_s <= '1'; led0_g_s <= '0'; led0_b_s <= '0';
            led1_r_s <= '1'; led1_g_s <= '0'; led1_b_s <= '0';    
        end if;
        -- azul
        if (switch0 = '0') and (switch1 = '1') then
            led0_r_s <= '0'; led0_g_s <= '0'; led0_b_s <= '1';
            led1_r_s <= '0'; led1_g_s <= '0'; led1_b_s <= '1';
        end if;      
    end process;

end Behavioral;