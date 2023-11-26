`timescale 1ns / 1ps
//ECE230 DP3 Ex2 Provided Counter Code
//ver: Nov11,2023, by DRAM

module counter
#( parameter integer width = 16 )    //parameter 'width' defines how many bits the counter contains
(
    input clk, cnt, load, rst,
    input [width-1:0] start,
    output reg [width-1:0] cout,
    output reg wrap
    );
    always @ (negedge clk or negedge rst) begin
    //nested if-else block to set counter mode
        if (!rst) begin                             //reset mode
            cout = 0;
        end else begin
            if (load) cout = start;                 //load mode
                else if (!cnt) cout = cout;         //hold mode
                    else if (cout) cout = cout -1;  //count mode, count down
                        else cout = start;          //count mode, wrap to start
    //if-else block to toggle wrap when cout=0                    
        if (!cout) wrap = 1;
            else wrap = 0;
        end 
    end      
endmodule
