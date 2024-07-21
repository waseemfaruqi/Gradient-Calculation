`timescale 1ns / 1ps

module X_to_XT #(parameter m =20, n= 3)
    (
    input [16*m*n-1:0] X,
    output reg [16*n*m-1:0] XT
    );
    
integer i, j;

always@(*)begin

for (i=0;i<n;i=i+1)begin
    for (j=0;j<m;j=j+1) begin
         XT[16*(n-i)*m-1-16*j -:16] = X[16*(n*m-i)-1-32*j -:16] ;
    end
end
end    

endmodule
