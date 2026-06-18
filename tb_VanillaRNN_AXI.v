`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 13:48:11
// Design Name: 
// Module Name: tb_VanillaRNN_AXI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_VanillaRNN_AXI;

reg s_axis_aclk;
reg s_axis_aresetn;

reg [31:0] s_axis_tdata;
reg        s_axis_tvalid;
wire       s_axis_tready;

wire [31:0] m_axis_tdata;
wire        m_axis_tvalid;
reg         m_axis_tready;

integer t;

// DUT
VanillaRNN_AXI uut
(
    .s_axis_aclk(s_axis_aclk),
    .s_axis_aresetn(s_axis_aresetn),

    .s_axis_tdata(s_axis_tdata),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),

    .m_axis_tdata(m_axis_tdata),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready)
);

//////////////////////////////////////////////////////
// Clock
//////////////////////////////////////////////////////

initial
    s_axis_aclk = 0;

always #5 s_axis_aclk = ~s_axis_aclk;

//////////////////////////////////////////////////////
// Input Sequence
//////////////////////////////////////////////////////

reg [31:0] input_seq [0:3];

initial
begin

    // {x3,x2,x1,x0}

    input_seq[0] = 32'b00001010_11111011_00000000_00000011;

    input_seq[1] = 32'b11101100_00001010_00000101_11111110;

    input_seq[2] = 32'b00011110_11110001_00001010_00000101;

    input_seq[3] = 32'b11011000_00010100_11111011_00001010;

end

//////////////////////////////////////////////////////
// Stimulus
//////////////////////////////////////////////////////

initial
begin

    s_axis_aresetn = 0;

    s_axis_tdata   = 0;
    s_axis_tvalid  = 0;

    m_axis_tready  = 1;

    #20;

    s_axis_aresetn = 1;

    #20;

    for(t=0;t<4;t=t+1)
    begin

        @(posedge s_axis_aclk);

        s_axis_tdata  <= input_seq[t];
        s_axis_tvalid <= 1'b1;

        @(posedge s_axis_aclk);

        s_axis_tvalid <= 1'b0;

        #20;

    end

    #100;

    $finish;

end

//////////////////////////////////////////////////////
// Monitor
//////////////////////////////////////////////////////

initial
begin

    $display("Time\tInput\t\t\t\tOutput");

    $monitor("%0t\t%h\t%h",
             $time,
             s_axis_tdata,
             m_axis_tdata);

end

endmodule