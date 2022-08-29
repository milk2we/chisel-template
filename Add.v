module Add(
  input         clock,
  input         reset,
  output        io_input1_ready,
  input         io_input1_valid,
  input  [27:0] io_input1_bits,
  output        io_input2_ready,
  input         io_input2_valid,
  input  [27:0] io_input2_bits,
  input         io_output_ready,
  output        io_output_valid,
  output [27:0] io_output_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [27:0] x; // @[arithmetic.scala 105:26]
  reg [27:0] y; // @[arithmetic.scala 106:26]
  reg  busy; // @[arithmetic.scala 107:30]
  reg  resultValid; // @[arithmetic.scala 108:30]
  wire  _io_input1_ready_T = ~busy; // @[arithmetic.scala 110:24]
  wire  _GEN_2 = io_input1_valid & io_input2_valid | ~busy; // @[arithmetic.scala 124:51 Decoupled.scala 81:20 arithmetic.scala 110:21]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[arithmetic.scala 124:51 131:18 107:30]
  assign io_input1_ready = busy ? ~busy : _GEN_2; // @[arithmetic.scala 115:17 110:21]
  assign io_input2_ready = busy ? _io_input1_ready_T : _GEN_2; // @[arithmetic.scala 115:17 111:21]
  assign io_output_valid = resultValid; // @[arithmetic.scala 112:21]
  assign io_output_bits = x + y; // @[arithmetic.scala 116:28]
  always @(posedge clock) begin
    if (!(busy)) begin // @[arithmetic.scala 115:17]
      if (io_input1_valid & io_input2_valid) begin // @[arithmetic.scala 124:51]
        x <= io_input1_bits; // @[arithmetic.scala 128:15]
      end
    end
    if (!(busy)) begin // @[arithmetic.scala 115:17]
      if (io_input1_valid & io_input2_valid) begin // @[arithmetic.scala 124:51]
        y <= io_input2_bits; // @[arithmetic.scala 129:15]
      end
    end
    if (reset) begin // @[arithmetic.scala 107:30]
      busy <= 1'h0; // @[arithmetic.scala 107:30]
    end else if (busy) begin // @[arithmetic.scala 115:17]
      if (io_output_ready & resultValid) begin // @[arithmetic.scala 119:49]
        busy <= 1'h0; // @[arithmetic.scala 120:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[arithmetic.scala 108:30]
      resultValid <= 1'h0; // @[arithmetic.scala 108:30]
    end else if (busy) begin // @[arithmetic.scala 115:17]
      if (io_output_ready & resultValid) begin // @[arithmetic.scala 119:49]
        resultValid <= 1'h0; // @[arithmetic.scala 121:25]
      end else begin
        resultValid <= 1'h1; // @[arithmetic.scala 117:21]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  x = _RAND_0[27:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[27:0];
  _RAND_2 = {1{`RANDOM}};
  busy = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  resultValid = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
