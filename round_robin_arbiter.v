// Author : Asif Khan
// Mail : asi.f.khan@hotmail.com


/// Priority -> User0> User1> User2

module round_robin_arbiter(
    input clk, rst,
    input [2:0] req_inputs,
    output reg [2:0] grant_outputs
);

reg [1:0] current_state;
reg [1:0] next_state;

parameter [1:0] IDLE = 2'b00;
parameter [1:0] STATE_0 = 2'b01;
parameter [1:0] STATE_1 = 2'b10;
parameter [1:0] STATE_2 = 2'b11;

always @(posedge clk or posedge rst) begin
    if(rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @(*) begin
    case(current_state)
        IDLE: begin
            if(req_inputs[0])
                next_state = STATE_0;
            else if(req_inputs[1])
                next_state = STATE_1;
            else if(req_inputs[2])
                next_state = STATE_2;
            else
                next_state = IDLE;
        end

        STATE_0: begin
            if(req_inputs[1])
                next_state = STATE_1;
            else if(req_inputs[2])
                next_state = STATE_2;
            else if(req_inputs[0])
                next_state = STATE_0;
            else
                next_state = IDLE;
        end

        STATE_1: begin
            if(req_inputs[2])
                next_state = STATE_2;
            else if(req_inputs[0])
                next_state = STATE_0;
            else if(req_inputs[1])
                next_state = STATE_1;
            else
                next_state = IDLE;
        end

        STATE_2: begin
            if(req_inputs[0])
                next_state = STATE_0;
            else if(req_inputs[1])
                next_state = STATE_1;
            else if(req_inputs[2])
                next_state = STATE_2;
            else
                next_state = IDLE;
        end

        default: next_state = IDLE;
    endcase
end

always @(*) begin
    case(current_state)
        STATE_0: grant_outputs = 3'b001;
        STATE_1: grant_outputs = 3'b010;
        STATE_2: grant_outputs = 3'b100;
        default: grant_outputs = 3'b000;
    endcase
end

endmodule