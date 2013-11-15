library verilog;
use verilog.vl_types.all;
entity functPPR is
    port(
        PP0             : in     vl_logic_vector(8 downto 0);
        PP1             : in     vl_logic_vector(8 downto 0);
        PP2             : in     vl_logic_vector(8 downto 0);
        PP3             : in     vl_logic_vector(8 downto 0);
        Sign0           : in     vl_logic;
        Sign1           : in     vl_logic;
        Sign2           : in     vl_logic;
        C0              : out    vl_logic;
        C1              : out    vl_logic;
        C10             : out    vl_logic;
        C11             : out    vl_logic;
        C12             : out    vl_logic;
        C2              : out    vl_logic;
        C3              : out    vl_logic;
        C4              : out    vl_logic;
        C5              : out    vl_logic;
        C6              : out    vl_logic;
        C7              : out    vl_logic;
        C8              : out    vl_logic;
        C9              : out    vl_logic;
        S0              : out    vl_logic;
        S1              : out    vl_logic;
        S10             : out    vl_logic;
        S11             : out    vl_logic;
        S12             : out    vl_logic;
        S2              : out    vl_logic;
        S3              : out    vl_logic;
        S4              : out    vl_logic;
        S5              : out    vl_logic;
        S6              : out    vl_logic;
        S7              : out    vl_logic;
        S8              : out    vl_logic;
        S9              : out    vl_logic
    );
end functPPR;
