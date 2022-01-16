`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:08 01/02/2019 
// Design Name: 
// Module Name:    TopModule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(clk,
				 reset
				
    );

	input clk, reset;
	
	reg 	[7:0] data_out;
	reg 	[7:0] write;

	wire 	[7:0] ram_out;
	reg     [7:0] ram_address;
	wire 	[9:0] address_1, address_2 ;
	wire 	[17:0] instruction_1, instruction_2 ;
	wire	[7:0] port_id_1, port_id_2 ;
	wire 	write_strobe_1, read_strobe_1, interrupt_ack_1 ;
	wire 	write_strobe_2, read_strobe_2, interrupt_ack_2 ;
	wire	[7:0]	out_port_1, out_port_2 ;
	reg	[7:0]	in_port_1, in_port_2 ;
	
	BRAM BLOCK_RAM( .clka(clk), .wea(1'b0), .addra(ram_address), .dina(8'b00000000), .douta(ram_out));
	
	kcpsm3 pico_1(.address(address_1), .instruction(instruction_1), .port_id(port_id_1), .write_strobe(write_strobe_1), .out_port(out_port_1), .read_strobe(read_strobe_1), 
				  .in_port(in_port_1), .interrupt(1'b0), .interrupt_ack(interrupt_ack_1), .reset(reset), .clk(clk)) ;
				  
	pb1 picoins_1(.address(address_1), .instruction(instruction_1), .clk(clk));
	
	kcpsm3 pico_2(.address(address_2), .instruction(instruction_2), .port_id(port_id_2), .write_strobe(write_strobe_2), .out_port(out_port_2), .read_strobe(read_strobe_2), 
				  .in_port(in_port_2), .interrupt(1'b0), .interrupt_ack(interrupt_ack_2 ), .reset(reset), .clk(clk)) ;
				  
	pb2 picoins_2(.address(address_2), .instruction(instruction_2), .clk(clk));
	
	always@* begin 
	
	in_port_1=ram_out;
	
	end
	
	
	
	
	
	always@(posedge clk) begin
		
		
			if (write_strobe_1==1) begin
		
				ram_address=port_id_1;
				in_port_2=out_port_1;
			end 
			
		
	end

endmodule
