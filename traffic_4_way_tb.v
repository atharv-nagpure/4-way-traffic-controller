module traffic_4_way_tb();
wire [2:0] signal_1, signal_2, signal_3, signal_4;
reg clk, rst;

traffic_4_way uut(signal_1, signal_2, signal_3, signal_4, clk, rst);

initial
begin
rst= 1'b1;
clk=1'b0;
#2 rst=1'b0;
$monitor ($time, "clk= %d, signal_1= %3b, signal_2= %3b, signal_3= %3b, signal_4= %3b", clk, signal_1, signal_2, signal_3, signal_4);
#800 $finish;
end

always #5 clk=~clk;
endmodule
