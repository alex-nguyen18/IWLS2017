module test_top;
    reg clk;
    reg [7:0] inputs; // example length
    reg [3:0] outputs; 
    integer resultsFile;

    initial begin
        clk = 1'b0;
        inputs = 8'b00000000;
	end

	initial begin
        resultsFile = $fopen("resultsFile.txt");
		#257
		$fclose(resultsFile);
		$finish;
	end

	always #1 clk = ~clk;

    always @ posedge (clk) begin
        $fwrite(resultsFile, "input = %d; output = %d\n", inputs, outputs);
        inputs++;
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
