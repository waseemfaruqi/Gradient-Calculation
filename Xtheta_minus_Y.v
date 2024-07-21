`timescale 1ns / 1ps

module Xtheta_minus_Y #(parameter m =20)
    (
    input [32*m-1:0] X_theta,
    input [32*m-1:0] Y,
    output reg [32*m-1:0] Xtheta_Y
    );
    
    integer i;
    
    always@(*) begin
    for (i=0;i<m;i=i+1) begin
         Xtheta_Y[32*m-1-32*i -:32] = X_theta[32*m-1-32*i -:32] - Y[32*m-1-32*i -:32] ;
    end
    end
endmodule
