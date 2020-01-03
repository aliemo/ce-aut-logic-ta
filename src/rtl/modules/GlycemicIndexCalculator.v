`timescale 1ns / 1ps
`default_nettype none

/*
**********************************************************
** Logic Design Final Project Fall, 2019 Semester
** Amirkabir University of Technology (Tehran Polytechnic)
** Department of Computer Engineering (CEIT-AUT)
** Logic Circuit Design Laboratory
** https://ceit.aut.ac.ir
**********************************************************
** Student ID: XXXXXXX
** Student ID: XXXXXXX
**********************************************************
** Module Name: GlycemicIndexCalculator
**********************************************************
** Additional Comments:
*/

module GlycemicIndexCalculator(
        bloodSensor,
        glycemicIndex);
input [7:0] bloodSensor;
output [3:0] glycemicIndex;

reg [3:0] onesCount;
reg [7:0] absuloteValue ;
integer i;

	always @(bloodSensor)
	begin
		onesCount = 0;
		absuloteValue = bloodSensor;
		if (bloodSensor[7] == 1)
		begin
			absuloteValue = -bloodSensor;
		end
		for (i = 0; i <= 7; i = i+1) begin
			if (absuloteValue[i] == 1) begin
				onesCount = onesCount + 1;
			end
		end
	end
	assign glycemicIndex = onesCount;
	
endmodule 