// Author : Asif Khan
// Mail : asi.f.khan@hotmail.com


// Code your design here
module my_custom_round_robin_arbiter (
    reset_an,
    clock,
    user_requests,
    granted
);

input       reset_an;      // Active-low reset signal
input       clock;         // Clock signal
input   [2:0]   user_requests;  // Adjusted to support 3 user requests
output  [2:0]   granted;        // Adjusted to support 3 user requests

reg [1:0] rotation_pointer;
reg [2:0] shifted_requests;
reg [2:0] shifted_grants;
reg [2:0] combined_grants;
reg [2:0] granted;

// Shift user requests to implement round-robin priority
always @ (*)
begin
    case (rotation_pointer[1:0])
        2'b00: shifted_requests[2:0] = user_requests[2:0];
        2'b01: shifted_requests[2:0] = {user_requests[0], user_requests[2:1]};
        2'b10: shifted_requests[2:0] = {user_requests[1:0], user_requests[2]};
        2'b11: shifted_requests[2:0] = {user_requests[2], user_requests[1:0]};
    endcase
end

// Simple priority arbiter logic
always @ (*)
begin
    shifted_grants[2:0] = 3'b0;
    if (shifted_requests[0])   shifted_grants[0] = 1'b1;
    else if (shifted_requests[1])  shifted_grants[1] = 1'b1;
    else if (shifted_requests[2])  shifted_grants[2] = 1'b1;
end

// Generate combined grant signal
always @ (*)
begin
    case (rotation_pointer[1:0])
        2'b00: combined_grants[2:0] = shifted_grants[2:0];
        2'b01: combined_grants[2:0] = {shifted_grants[1:0], shifted_grants[2]};
        2'b10: combined_grants[2:0] = {shifted_grants[0], shifted_grants[2:1]};
        2'b11: combined_grants[2:0] = {shifted_grants[2], shifted_grants[1:0]};
    endcase
end

// Update the grant signal
always @ (posedge clock or negedge reset_an)
begin
    if (!reset_an)    granted[2:0] <= 3'b0;
    else        granted[2:0] <= combined_grants[2:0] & ~granted[2:0];
end

// Update the rotation pointer
always @ (posedge clock or negedge reset_an)
begin
    if (!reset_an)
        rotation_pointer[1:0] <= 2'b0;
    else 
        case (1'b1)
            granted[0]: rotation_pointer[1:0] <= 2'd1;
            granted[1]: rotation_pointer[1:0] <= 2'd2;
            granted[2]: rotation_pointer[1:0] <= 2'd0;
        endcase
end

endmodule
