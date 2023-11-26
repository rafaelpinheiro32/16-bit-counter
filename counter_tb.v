`timescale 1ns / 1ps
//ECE230 DP3 Ex2 Provided Counter Testbench, firstly 4-bits, later edited to 16-bits
//ver: Nov26,2023, by DRAM, edited by Rafael

module counter_tb;
    parameter WIDTH = 16;
    reg CLK, CNT, LOAD, RST;
    reg [WIDTH-1:0] START;
    wire [WIDTH-1:0] COUT;
    wire WRAP;

    counter 
    #(.width (WIDTH) ) //pass width parameter from design module
    i0 (CLK, CNT, LOAD, RST, START, COUT, WRAP);
    
    initial begin
        CLK = 0; CNT = 0; LOAD = 0; RST = 0; START = 0;
        end
//define free running CLK
    always #5 CLK=~CLK;
//set start value to max
    initial START = START -1;
//define counter mode sequence
//control signals all change on clk posedge so they are constant during clk negedge
    initial begin
        #15 RST = 1; //exit reset mode
        #20 LOAD = 1;  //load start value
        #20 LOAD = 0; CNT = 1; //switch to count mode
        #80 CNT = 0; //switch to hold mode
        #30 CNT = 1; //switch to count mode
        #80 START=16'h0E08; LOAD = 1; //load new start value
        #20 LOAD=0; //enter count mode
        #80 RST =0; //reset
        #10 RST =1; //switch to count mode
        end
    initial #400 $finish;
        
endmodule
