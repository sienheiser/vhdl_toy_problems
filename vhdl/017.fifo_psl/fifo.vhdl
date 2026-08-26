library ieee;
use ieee.std_logic_1164.all;


entity fifo is
    generic(
        g_WIDTH: natural := 32;
        g_HEIGHT: natural := 8
    );
    port(
        i_clk: in std_logic;
        i_rst: in std_logic;    

        i_wr_en: in std_logic;
        i_rd_en: in std_logic;
        in_data: in std_logic_vector(g_WIDTH - 1 downto 0);

        o_empty: out std_logic;
        o_full: out std_logic;
        out_data: out std_logic_vector(g_WIDTH - 1 downto 0)
    );
end entity fifo;


architecture behaviour of fifo is
    type t_data is array(g_HEIGHT - 1 downto 0) of std_logic_vector(g_WIDTH - 1 downto 0);
    signal fifo_buffer: t_data := (others => (others => '0'));
    signal empty: std_logic := '0';
    signal full: std_logic := '0';

    signal rd_index: integer range 0 to g_HEIGHT - 1 := 0;
    signal wr_index: integer range 0 to g_HEIGHT - 1 := 0;
    signal count: integer range 0 to g_HEIGHT - 1 := 0;

begin 
    proc:process(i_clk) is
        begin
            if rising_edge(i_clk) then
                if i_rst = '1' then
                    rd_index <= 0;
                    wr_index <= 0;
                    count <= 0;
                    out_data <= (others => '0');
                end if;
                if (i_wr_en = '1' and full = '0') and (i_rd_en = '1' and empty = '0') then
                    fifo_buffer(wr_index) <= in_data;
                    out_data <= fifo_buffer(rd_index);
                    rd_index <= (rd_index + 1) mod g_HEIGHT;
                    wr_index <= (wr_index + 1) mod g_HEIGHT;
                elsif (i_wr_en = '1' and full = '0') then
                    fifo_buffer(wr_index) <= in_data;
                    wr_index <= (wr_index + 1) mod g_HEIGHT;
                    count <= count + 1;
                elsif (i_rd_en = '1' and empty = '0') then
                    out_data <= fifo_buffer(rd_index);
                    rd_index <= (rd_index + 1) mod g_HEIGHT;
                    count <= count - 1;
                end if;
            end if;
    end process proc;

    empty <= '1' when count = 0 else '0';
    full <= '1' when count = g_HEIGHT - 1 else '0';

    o_empty <= empty;
    o_full <= full;

end architecture behaviour;

