module traffic_4_way(signal_1, signal_2, signal_3, signal_4, clk, rst);
input clk, rst;
output reg [2:0] signal_1, signal_2, signal_3, signal_4;
parameter RED= 3'b100, YELLOW= 3'b010, GREEN= 3'b001; 

reg [3:0] state;
parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7;

parameter Green_time= 8, Yellow_time= 2;
reg [3:0] green;
reg [1:0] yellow;

always@ (posedge clk)
begin

if(rst)
begin
signal_1<= RED;
signal_2<= RED;
signal_3<= RED;
signal_4<= GREEN;
green<= Green_time;
yellow<= Yellow_time;
state<= S0;
end

else
begin
case(state)
S0: begin
     if (green == 0)
      begin
       state<= S1;
       end
     else
      state<= S0;
      green<= green-1;
     end
S1: begin
     if (yellow == 0)
      begin
       state<= S2;
       green<= Green_time;
      end
     else
      begin
       state<= S1;
       yellow<= yellow-1;
      end
     end
S2: begin
     if(green == 0)
      begin
       state<= S3;
       yellow<= Yellow_time;
      end
     else
      begin
       state<= S2;
       green<= green-1;
      end
     end
S3: begin
     if(yellow == 0)
      begin
       state<= S4;
       green<= Green_time;
      end
     else
      begin
       state<= S3;
       yellow<= yellow-1;
      end
     end
S4: begin
     if(green == 0)
      begin
       state<= S5;
       yellow<= Yellow_time;
      end
     else
      begin
       state<= S4;
       green<= green-1;
      end
     end
S5: begin
     if(yellow == 0)
      begin
       state<= S6;
       green<= Green_time;
      end
     else
      begin
       state<= S5;
       yellow<= yellow-1;
      end
     end 
S6: begin
     if(green == 0)
      begin
       state<= S7;
       yellow<= Yellow_time;
      end
     else
      begin
       state<= S6;
       green<= green-1;
      end
     end
S7: begin
     if(yellow == 0)
      begin
       state<= S0;
       green<= Green_time;
      end
     else
      begin
       state<= S7;
       yellow<= yellow-1;
      end
     end              
default: begin
          state<= S0;
          green<= Green_time;
          yellow<= Yellow_time; 
         end
endcase
end
end
     
always @(*)
begin
signal_1= RED;
signal_2= RED;
signal_3= RED;
signal_4= GREEN;

case (state)
S0: signal_4= GREEN; 
S1: signal_4= YELLOW;
S2: signal_1= GREEN;
S3: signal_1= YELLOW;
S4: signal_2= GREEN;
S5: signal_2= YELLOW;
S6: signal_3= GREEN;
S7: signal_3= YELLOW;
endcase

end 
    
           
    
endmodule
