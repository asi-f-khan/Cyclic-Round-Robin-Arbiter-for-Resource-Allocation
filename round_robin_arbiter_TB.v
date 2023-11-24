////Testbenches


module round_robin_arbiter_tb();

reg clk;
reg rst;
reg [2:0] req_inputs;
wire [2:0] grant_outputs;

round_robin_arbiter dut (
    .clk(clk),
    .rst(rst),
    .req_inputs(req_inputs),
    .grant_outputs(grant_outputs)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd"); $dumpvars; // this line used to show wave form in EDA
    clk = 0;
    rst = 0;
    req_inputs = 0;

    req_inputs = 3'b001;
    #20;
    req_inputs = 3'b011;
    #20;
    req_inputs = 3'b100;
    #20;
    req_inputs = 3'b110;
    #20;
    req_inputs = 3'b101;
    #20;
    $finish;
end


endmodule
