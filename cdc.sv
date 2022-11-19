module cdc
(
  input CLK_100_i,
  input CLK_200_i,
  input EXAMPLE1_i,
  input EXAMPLE2_i,
  input EXAMPLE3_i,
  output EXAMPLE1_o,
  output EXAMPLE2_o,
  output EXAMPLE3_o
);

logic example1_reg1;
logic example1_reg2;

always @ (posedge CLK_100_i)
begin
  example1_reg1 <= EXAMPLE1_i;
end

always @ (posedge CLK_200_i)
begin
  example1_reg2 <= example1_reg1;
end
assign EXAMPLE1_o = example1_reg2;


logic example2_reg1;
logic example2_reg2;
logic example2_reg3;

always @ (posedge CLK_100_i)
begin
  example2_reg1 <= EXAMPLE2_i;
end

always @ (posedge CLK_200_i)
begin
  example2_reg2 <= example2_reg1;
  example2_reg3 <= example2_reg2;
end
assign EXAMPLE2_o = example2_reg3;


logic example3_reg1;
(* ASYNC_REG = "TRUE" *) logic example3_reg2;
(* ASYNC_REG = "TRUE" *) logic example3_reg3;

always @ (posedge CLK_100_i)
begin
  example3_reg1 <= EXAMPLE3_i;
end

always @ (posedge CLK_200_i)
begin
  example3_reg2 <= example3_reg1;
  example3_reg3 <= example3_reg2;
end
assign EXAMPLE3_o = example3_reg3;

endmodule
