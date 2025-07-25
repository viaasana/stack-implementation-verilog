module stack#(
    parameter WIDTH = 8,
    parameter DEPTH = 256
)(
    input clk,
    input push,
    input pop,
    input rst,
    input signed [WIDTH-1:0] data_in,
    output reg signed [WIDTH-1:0] data_out, 
    output reg full,
    output reg empty
);

    reg [WIDTH-1:0] stack[0:DEPTH-1];
    reg [$clog2(DEPTH):0] stack_ptr;


    always @(posedge clk or posedge rst) begin
        if(rst) begin
            stack_ptr <= 0;
            empty <= 0;
            full <=0;
        end else begin
            if(push && !full) begin
                stack[stack_ptr] <= data_in;
                stack_ptr <= stack_ptr + 1;
                empty <=0;
                if(stack_ptr == DEPTH-1) 
                    full <=1;
                else
                    full <=0;
            end else if(pop && !empty) begin
                stack_ptr <= stack_ptr -1;
                full <=0;
                if(stack_ptr == 0)
                    empty <= 1;
                else 
                    empty <=0;
            end
        end
    end

    always @(*) begin
        if(pop && !empty)
            data_out <= stack[stack_ptr];
        else
            data_out <= {WIDTH{1'bz}};
    end



endmodule