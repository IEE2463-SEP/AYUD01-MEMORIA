----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.08.2023 19:24:42
-- Design Name: 
-- Module Name: RAM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port (address: in std_logic_vector(1 downto 0);
          clk: in std_logic;
          enable: in std_logic;
          data_out: out std_logic_vector(3 downto 0) 
    );
end RAM;

architecture Behavioral of RAM is

type ram_array is array (0 to 3) of std_logic_vector (3 downto 0);

signal ram_data: ram_array := (
        b"1010", b"1111", b"0011", b"1001"
);
begin

process(clk)
begin
    if(rising_edge(clk)) then
        if(enable = '1') then
            data_out <= ram_data(to_integer(unsigned(address)));
        end if;
    end if;
end process;
end Behavioral;
