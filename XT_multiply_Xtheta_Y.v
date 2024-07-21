`timescale 1ns / 1ps

module XT_multiply_Xtheta_Y #(parameter m =20, n= 3)
    (
    input [16*n*m-1:0] XT,
    input [32*m-1:0] Xtheta_Y,
    output reg [32*n-1:0] gradient_vector
    );
    
reg signed [15:0] XT_tmp;
reg signed [31:0] Xtheta_Y_tmp;  
reg signed [31:0] tmp;
integer i, j;

always@(*)begin

for (i=0;i<n;i=i+1)begin
    tmp = 0;
    for (j=0;j<m;j=j+1) begin
         XT_tmp= XT[16*(n-i)*m-1-16*j -:16];
         Xtheta_Y_tmp = Xtheta_Y[32*m-1-32*j -:32];
         tmp =  tmp + XT_tmp* Xtheta_Y_tmp;
    end
    gradient_vector[32*n-1-32*i -: 32] = tmp;
end
end    

endmodule
