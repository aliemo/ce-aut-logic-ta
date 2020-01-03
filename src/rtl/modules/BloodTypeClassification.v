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
** Module Name: BloodTypeClassification
**********************************************************
** Additional Comments:
*/

module BloodTypeClassification(
        bloodType,
        bloodClass);
input [2:0] bloodType;
output bloodClass;

reg bloodClassVar;

  always @(*) 
	begin
   	 case(bloodType[2:1])
   			2'b00: bloodClassVar <= 1'b1;
   			2'b01: bloodClassVar <= 1'b0;
   			2'b10: bloodClassVar <= bloodType[0];
   			2'b11: bloodClassVar <= 1'b0;
   	endcase
   end
   
	assign bloodClass = bloodClassVar;
	
endmodule