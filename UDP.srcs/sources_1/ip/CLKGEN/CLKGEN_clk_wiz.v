
// file: CLKGEN.v
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// __clk125___125.000______0.000______50.0______125.247_____98.575
// __clk100___100.000______0.000______50.0______130.958_____98.575
// ___clk10____10.000______0.000______50.0______209.588_____98.575
// clk125_90___125.000_____90.000______50.0______125.247_____98.575
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps

module CLKGEN_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output        clk125,
  output        clk100,
  output        clk10,
  output        clk125_90,
  // Status and control signals
  input         reset,
  output        locked,
  input         SYSCLK
 );
  // Input buffering
  //------------------------------------
wire SYSCLK_CLKGEN;
wire clk_in2_CLKGEN;
  IBUF clkin1_ibufg
   (.O (SYSCLK_CLKGEN),
    .I (SYSCLK));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk125_CLKGEN;
  wire        clk100_CLKGEN;
  wire        clk10_CLKGEN;
  wire        clk125_90_CLKGEN;
  wire        clk_out5_CLKGEN;
  wire        clk_out6_CLKGEN;
  wire        clk_out7_CLKGEN;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_CLKGEN;
  wire        clkfbout_buf_CLKGEN;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
   wire clkout2b_unused;
   wire clkout3b_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg1 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg2 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg3 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg4 = 0;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (10.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (8.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (10),
    .CLKOUT1_PHASE        (0.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (100),
    .CLKOUT2_PHASE        (0.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKOUT3_DIVIDE       (8),
    .CLKOUT3_PHASE        (90.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT3_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10.000))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_CLKGEN),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clk125_CLKGEN),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clk100_CLKGEN),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clk10_CLKGEN),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clk125_90_CLKGEN),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_CLKGEN),
    .CLKIN1              (SYSCLK_CLKGEN),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (locked_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = reset; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_CLKGEN),
    .I (clkfbout_CLKGEN));







  BUFGCE clkout1_buf
   (.O   (clk125),
    .CE  (seq_reg1[7]),
    .I   (clk125_CLKGEN));

  BUFH clkout1_buf_en
   (.O   (clk125_CLKGEN_en_clk),
    .I   (clk125_CLKGEN));
  always @(posedge clk125_CLKGEN_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	    seq_reg1 <= 8'h00;
    end
    else begin
        seq_reg1 <= {seq_reg1[6:0],locked_int};
  
    end
  end


  BUFGCE clkout2_buf
   (.O   (clk100),
    .CE  (seq_reg2[7]),
    .I   (clk100_CLKGEN));
 
  BUFH clkout2_buf_en
   (.O   (clk100_CLKGEN_en_clk),
    .I   (clk100_CLKGEN));
 
  always @(posedge clk100_CLKGEN_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	  seq_reg2 <= 8'h00;
    end
    else begin
        seq_reg2 <= {seq_reg2[6:0],locked_int};
  
    end
  end


  BUFGCE clkout3_buf
   (.O   (clk10),
    .CE  (seq_reg3[7]),
    .I   (clk10_CLKGEN));
 
  BUFH clkout3_buf_en
   (.O   (clk10_CLKGEN_en_clk),
    .I   (clk10_CLKGEN));
 
  always @(posedge clk10_CLKGEN_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	  seq_reg3 <= 8'h00;
    end
    else begin
        seq_reg3 <= {seq_reg3[6:0],locked_int};
  
    end
  end


  BUFGCE clkout4_buf
   (.O   (clk125_90),
    .CE  (seq_reg4[7]),
    .I   (clk125_90_CLKGEN));

  BUFH clkout4_buf_en
   (.O   (clk125_90_CLKGEN_en_clk),
    .I   (clk125_90_CLKGEN));
	
  always @(posedge clk125_90_CLKGEN_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	  seq_reg4 <= 8'h00;
    end
    else begin
        seq_reg4 <= {seq_reg4[6:0],locked_int};
  
    end
  end





endmodule
