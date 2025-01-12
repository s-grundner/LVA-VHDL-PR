library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;
use work.std_definitions.all;
use work.commands.all;

entity cmd_proc is
    generic ( 
        D : natural
    );
    port (
        clk_i : in std_ulogic;
        rst_i : in std_ulogic;

        start_strb_i : in std_ulogic;
        drawing_o : out std_ulogic;
            
        x_servo_o : out unsigned(SERVO_RESOLUTION-1 downto 0);
        y_servo_o : out unsigned(SERVO_RESOLUTION-1 downto 0);
        z_servo_o : out unsigned(SERVO_RESOLUTION-1 downto 0)
    );
end cmd_proc;

architecture behav of cmd_proc is

    type fsm_state_type is (IDLE, DRAWING);
    signal fsm_state, next_fsm_state  : fsm_state_type;
    signal curr_addr, next_addr       : unsigned(COMCNTBW-1 downto 0) := (others => '0');
    signal curr_cmd                   : std_ulogic_vector(2*SERVO_RESOLUTION-1 downto 0) := (others => '0');
    signal step_strb, micro_step_strb : std_ulogic := '0';
    signal sync_rst                   : std_ulogic := '0';
    signal dx, dy                     : signed(SERVO_RESOLUTION-1 downto 0);

begin

    x_servo_o <= unsigned(dx + to_signed(SERVO_MIN_ANGLE, SERVO_RESOLUTION));
    y_servo_o <= unsigned(dy + to_signed(SERVO_MIN_ANGLE + SERVO_RANGE/2, SERVO_RESOLUTION)); -- angle (90 degree offset)

    reg_seq : process (clk_i, rst_i) is
    begin
        if rst_i = '1' then
            curr_addr <= (others => '0');
            fsm_state <= IDLE;
        elsif rising_edge(clk_i) then
            curr_addr <= next_addr;
            fsm_state <= next_fsm_state;
        end if;
    end process reg_seq;

    fsm_comb : process (start_strb_i, curr_addr, fsm_state, step_strb) is
    begin
        sync_rst       <= '0';
        next_fsm_state <= fsm_state;
        next_addr      <= curr_addr;
        z_servo_o      <= to_unsigned(SERVO_MAX_ANGLE, SERVO_RESOLUTION);
        drawing_o      <= '0';

        case fsm_state is
            when IDLE =>
                next_addr <= (others => '0');
                if start_strb_i = '1' then
                    sync_rst <= '1';
                    next_fsm_state <= DRAWING;
                end if;

            when DRAWING =>
                drawing_o <= '1';
                if curr_addr >= NCOMMANDS-1 then
                    next_fsm_state <= IDLE;
                elsif curr_addr >= 11 and curr_addr < NCOMMANDS-3 then
                    z_servo_o <= to_unsigned(SERVO_MIN_ANGLE, SERVO_RESOLUTION);
                end if;
                
                if step_strb = '1' then
                    next_addr <= curr_addr + 1;
                end if;

            when others =>
                next_fsm_state <= IDLE;
        end case;
    end process fsm_comb;

    accu_reg_dr_ent : entity work.accu_reg(behav)
    generic map (
        D        => D,
        BITWIDTH => SERVO_RESOLUTION
    )
    port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        accu_strb_i => micro_step_strb,
        data_i      => curr_cmd(2*SERVO_RESOLUTION-1 downto SERVO_RESOLUTION),
        data_o      => dx
    );

    accu_reg_dtheta_ent : entity work.accu_reg(behav)
    generic map (
        D        => D,
        BITWIDTH => SERVO_RESOLUTION
    )
    port map (
        clk_i       => clk_i,
        rst_i       => rst_i,
        accu_strb_i => micro_step_strb,
        data_i      => curr_cmd(SERVO_RESOLUTION-1 downto 0),
        data_o      => dy
    );

    step_strb_ent : entity work.strb_generator(behav)
    generic map (
        PRESCALER => MICRO_STEP_TIME_PS*2**D -- Time for one step
    )
    port map (
        clk_i      => clk_i,
        rst_i      => rst_i,
        sync_rst_i => sync_rst,
        strb_o     => step_strb
    );

    micro_step_strb_ent : entity work.strb_generator(behav)
    generic map (
        PRESCALER => MICRO_STEP_TIME_PS -- Time for one microstep
    )
    port map (
        clk_i      => clk_i,
        rst_i      => rst_i,
        sync_rst_i => sync_rst,
        strb_o     => micro_step_strb
    );

    rom_ent : entity work.cmd_rom(behav)
    port map (
        clk_i  => clk_i,
        addr_i => curr_addr,
        data_o => curr_cmd
    );

end architecture;