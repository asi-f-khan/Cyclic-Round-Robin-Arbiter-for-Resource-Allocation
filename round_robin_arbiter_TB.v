// Code your testbench here
// or browse Examples
module tb_custom_round_robin();

reg clk;
reg req0;
reg req1;
reg req2;
reg rst_an;

my_custom_round_robin_arbiter dut (
    .reset_an(rst_an),
    .clock(clk),
    .user_requests({req2, req1, req0}),
    .granted({grant2, grant1, grant0})
);

initial
begin
    // Testbench initialization
  $dumpfile("dump.vcd"); 
  $dumpvars;
    clk = 0;
    req2 = 0;
    req1 = 0;
    req0 = 0;
    rst_an = 1'b1;

    #10 rst_an = 0;
    #10 rst_an = 1;

    // Test scenario
    repeat (1) @ (posedge clk);
    req0 <= 1;

    repeat (1) @ (posedge clk);
    req0 <= 0;

    repeat (1) @ (posedge clk);
    req0 <= 1;

    req1 <= 1;

    repeat (1) @ (posedge clk);
    req2 <= 1;
    req1 <= 0;

    repeat (1) @ (posedge clk);
    req2 <= 0;

    repeat (1) @ (posedge clk);
    req0 <= 0;

    repeat (1) @ (posedge clk);
    #10 $finish;

end

always #1 clk = ~clk;

endmodule
