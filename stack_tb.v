`timescale 1ps/1ps

module stack_tb#(
    parameter WIDTH = 8,
    parameter DEPTH = 256
);

    reg push;
    reg pop;
    reg rst;
    reg clk;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out; 
    wire full;
    wire empty;

    stack uut (
        .clk(clk),
        .push(push),
        .pop(pop),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out), 
        .full(full),
        .empty(empty)
    );


    always #5 clk = ~clk;

    initial begin
        clk = 0;
        push = 0;
        pop = 0;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        push = 1;
        $display("%0t push 10", $time);
        data_in = 8'd10;
        #10;
        push = 0;
        #10;
        push =1;
        $display("%0t push 20", $time);
        data_in = 8'd20;
        #10;
        push = 0;
        #10;
        push =1;
        $display("%0t push 5", $time);
        data_in = 8'd5;
        #10;
        push = 0;
        #10;
        push =1;
        $display("%0t push 25", $time);
        data_in = 8'd25;
        #10;
        push = 0;
        pop = 1;
        #10;
        $display("pop, data out=%d (expect 25)", data_out);
        #10;
        $display("pop, data out=%d (expect 5)", data_out);
        #10;
        $display("pop, data out=%d (expect 20)", data_out);
        #10;
        $display("pop, data out=%d (expect 10)", data_out);
        #10;
         $display("pop, data out=%d (pop the empty stack)", data_out);
        #10;



    end


endmodule