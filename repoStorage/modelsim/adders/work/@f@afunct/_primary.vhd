library verilog;
use verilog.vl_types.all;
entity FAfunct is
    port(
        co              : out    vl_logic;
        s               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic
    );
end FAfunct;
