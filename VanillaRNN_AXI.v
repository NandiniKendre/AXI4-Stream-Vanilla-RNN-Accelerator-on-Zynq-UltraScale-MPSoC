`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 13:47:23
// Design Name: 
// Module Name: VanillaRNN_AXI
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

module VanillaRNN_AXI #
(
    parameter DATA_W = 8,
    parameter I      = 4,
    parameter H      = 4
)
(
    input  wire s_axis_aclk,
    input  wire s_axis_aresetn,

    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    output wire        s_axis_tready,

    output reg  [31:0] m_axis_tdata,
    output reg         m_axis_tvalid,
    input  wire        m_axis_tready
);

assign s_axis_tready = 1'b1;

reg signed [31:0] x_in_flat;
wire signed [31:0] h_out_flat;

reg valid_rnn;

VanillaRNN_Core
#(
    .DATA_W(DATA_W),
    .I(I),
    .H(H)
)
core_inst
(
    .clk(s_axis_aclk),
    .reset(~s_axis_aresetn),
    .valid_in(valid_rnn),
    .x_in_flat(x_in_flat),
    .h_out_flat(h_out_flat)
);

always @(posedge s_axis_aclk)
begin

    if(!s_axis_aresetn)
    begin
        x_in_flat <= 0;
        valid_rnn <= 0;
    end

    else
    begin

        valid_rnn <= 0;

        if(s_axis_tvalid)
        begin
            x_in_flat <= s_axis_tdata;
            valid_rnn <= 1'b1;
        end

    end

end

always @(posedge s_axis_aclk)
begin

    if(!s_axis_aresetn)
    begin
        m_axis_tdata  <= 0;
        m_axis_tvalid <= 0;
    end

    else
    begin

        if(valid_rnn)
        begin
            m_axis_tdata  <= h_out_flat;
            m_axis_tvalid <= 1'b1;
        end

        else if(m_axis_tready)
        begin
            m_axis_tvalid <= 1'b0;
        end

    end

end

endmodule