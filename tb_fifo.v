module tb_fifo;
    reg clk,rst_n,wr_en,rd_en;
    reg[7:0]data_in;
    
    wire[7:0]data_out;
    wire full,empty;
    
    FIFO uut(.clk(clk),.rst_n(rst_n),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
    
    initial begin 
    clk =0;
    forever #5 clk =~clk;
    end
    
 initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0,tb_fifo);
    rst_n = 0;
    wr_en =0;
    rd_en = 0;
    data_in = 0;
    
   #10 rst_n = 1;
   //write 4 values
   repeat(4)begin
   @(posedge clk);
   wr_en =1;
   data_in = $random;
    end
   
   wr_en =0;
   //read 4 values
   repeat(4)begin
     @(posedge clk);
     rd_en = 1;
   end
     rd_en = 0;
     #20 $finish;
 end
   
endmodule