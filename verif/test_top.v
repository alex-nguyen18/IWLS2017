module test_top;
    reg clk;
    reg [7:0] inputs; // example length
    reg [3:0] outputs; 
    integer resultsFile;

    initial begin
        clk = 1'b0;
        inputs = 8'b00000000;
        resultsFile = $fopen("resultsFile.txt");

		always #5 clk = ~clk;

        always @ posedge (clk) begin
            $fwrite(resultsFile, outputs);
            inputs++;
        end
    end

test_yig TEST_YIG (
    .pi0           (inputs[0])
,   .pi1           (inputs[1])
//etc
,   .po0          (outputs[0])
,   .po1          (outputs[1])
//etc
);

endmodule
