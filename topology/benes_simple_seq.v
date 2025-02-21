`timescale 1ns / 1ps
/*
    Top Module:  benes_simple_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Pipeline:
                 [full pipeline]every stage is a pipeline stage
                                Total latency = # stages (cycle)
                 [2 stage pipeline] 0~LEVEL is the first pipeline stage.
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    Unicast  or  Multicast(Not arbitrary Multicast)

        i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-->
        i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|-->
                                         ID:       0    X        4     X      8     X      12      X     16
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
        i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
                                         ID:       1    X  X     5            9            13   X  X     17
        i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
        i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
                                         ID:       2    X        6     X      10    X      14      X     18
        i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
        i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->
                                         ID:       3             7            11           15            19
           CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE
          CONNECTION GROUP SIZE                         8             4             4             8


    Control Signal
        i_valid[0]-->|¯¯¯|<--i_cmd[2:0]
        i_valid[1]-->|___|

     The command lay out is shown below: Note: switch ID is specified in the diagram above.

     i_cmd: MSB [ ------------------------------------------------------------------------------------- ] LSB
      cmd for   SW19 SW18 SW17 SW16 SW15 SW14 SW13 SW12 SW11 SW10 SW9 SW8 SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

`define FULL_PIPELINE
// `define PIPELINE2STAGE

`ifdef FULL_PIPELINE // full pipeline means every stage is a pipeline stage.

// Note: use the SIMPLE_MODULAR version distribute_2x2_simple_seq.
// Need to set "`define SIMPLE_MODULAR in distribute_2x2_simple_seq.v"

module benes_simple_seq#(
    parameter DATA_WIDTH = 32,      // could be arbitrary number
    parameter COMMAND_WIDTH  = 2,   // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
    parameter NUM_INPUT_DATA = 8    // multiple be 2^n
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);
    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    localparam LEVEL = $clog2(NUM_INPUT_DATA);
    localparam TOTAL_STAGE = 2*LEVEL-1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    input                                        clk;
    input                                        rst_n;

    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_INPUT_DATA-1:0]                  o_valid;
    output [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                   i_cmd;
                                    // 11 --> Multicast_HighIn
                                    // 00 --> Multicast_LowIn
                                    // 10 --> Pass Through
                                    // 01 --> Pass Switch

    // inner logic
    wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
    wire                                         connection_valid[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];

    genvar i,j,k,s,p;
    generate

        // logic for control pipeline
        for(i=0; i<TOTAL_STAGE-1;i=i+1)
        begin:cmd_pipeline_stage
            localparam NUM_STAGE = TOTAL_STAGE-i-1;
            reg  [COMMAND_WIDTH-1:0]                pipeline_i_cmd_reg[0:NUM_STAGE-1][0:NUM_SWITCH_IN-1]; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 1 instead of stage 0.
        end

        for(i=0;i<TOTAL_STAGE-1;i=i+1)  // from second stage to the end;
        begin:sec_to_end
            for(j=0;j<NUM_SWITCH_IN;j=j+1)
            begin:loop_switch
                always@(posedge clk or negedge rst_n)
                begin
                    cmd_pipeline_stage[0].pipeline_i_cmd_reg[i][j] <= i_cmd[((i+1)*NUM_SWITCH_IN+j)*COMMAND_WIDTH+:COMMAND_WIDTH];
                end
            end
        end

        for(p=0; p<TOTAL_STAGE-2;p=p+1)
        begin:third_to_end
            localparam NUM_STAGE_IN_PIPELINE = TOTAL_STAGE-p-1;
            for(i=0;i<NUM_STAGE_IN_PIPELINE;i=i+1)  // from second stage to the end;
            begin:loop_stage
                for(j=0;j<NUM_SWITCH_IN;j=j+1)
                begin:loop_switch
                    always@(posedge clk or negedge rst_n)
                    begin
                        cmd_pipeline_stage[p+1].pipeline_i_cmd_reg[i][j] <= cmd_pipeline_stage[p].pipeline_i_cmd_reg[i+1][j];
                    end
                end
            end
        end

        // first stage
        for(i=0; i<NUM_SWITCH_IN; i=i+1)
        begin:first_stage_switch
            distribute_2x2_simple_seq #(
                .DATA_WIDTH(DATA_WIDTH),
                .COMMAND_WIDTH(COMMAND_WIDTH)
            ) first_stage(
                .clk(clk),
                .rst_n(rst_n),
                .i_valid(i_valid[2*i+:2]),
                .i_data_bus(i_data_bus[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
                .o_valid({connection_valid[0][2*i+1], connection_valid[0][2*i]}),
                .o_data_bus({connection[0][2*i+1], connection[0][2*i]}),
                .i_en(i_en),
                .i_cmd(i_cmd[i*COMMAND_WIDTH+:COMMAND_WIDTH])
            );
        end


        // second stage -> middle stage
        // inverse shuffle function [loop right shift]:  output of i-th stage    -> input of (i+1)-th stage
        // shuffle function         [loop left shift]:   input of (i+1)-th stage -> output of i-th stage
        for(s=0;s<(LEVEL-1);s=s+1)
        begin:first_half_stages
            localparam NUM_GROUP = 1<<s;
            localparam NUM_SWITCH_GROUP = NUM_SWITCH_IN>>s;
            localparam LEN_GOURP = $clog2(NUM_INPUT_DATA)-1-s;
            for(k=0;k<NUM_GROUP;k=k+1)
            begin:group_first_half
                for(i=0;i<NUM_SWITCH_GROUP;i=i+1)
                begin:switch_first_half
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_switch_offset = k*(NUM_SWITCH_IN>>s);
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_offset = k*(NUM_INPUT_DATA>>s);
                    localparam                                MASK =  (1 << ($clog2(NUM_INPUT_DATA)-s)) - 1;

                    // For low input [Loop left Shift (2*i)]
                    localparam                                l_idx = (i << 1) & MASK;
                    localparam                                l_idx_left_shift = (l_idx << 1) & MASK;
                    localparam                                l_idx_MSB_1 = (1'b1 << LEN_GOURP) & MASK;
                    localparam                                l_idx_MSB_is_1 = l_idx & l_idx_MSB_1;
                    localparam                                l_idx_MSB_loop_shift = l_idx_MSB_is_1 >> LEN_GOURP;
                    localparam                                l_idx_loop_left_shift = l_idx_MSB_loop_shift + l_idx_left_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   l_idx_loop_left_shift_group = l_idx_loop_left_shift + group_offset;

                    // For high input [Loop left Shift (2*i)+1]
                    localparam                                h_idx = ((i << 1) + 1) & MASK;
                    localparam                                h_idx_left_shift = (h_idx << 1) & MASK;
                    localparam                                h_idx_MSB_1 = (1'b1 << LEN_GOURP) & MASK;
                    localparam                                h_idx_MSB_is_1 =  h_idx&h_idx_MSB_1;
                    localparam                                h_idx_MSB_loop_shift = h_idx_MSB_is_1 >> LEN_GOURP;
                    localparam                                h_idx_loop_left_shift = h_idx_MSB_loop_shift + h_idx_left_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   h_idx_loop_left_shift_group = h_idx_loop_left_shift + group_offset;

                    distribute_2x2_simple_seq #(
                        .DATA_WIDTH(DATA_WIDTH),
                        .COMMAND_WIDTH(COMMAND_WIDTH)
                    ) second_stage(
                        .clk(clk),
                        .rst_n(rst_n),
                        .i_valid({connection_valid[s][h_idx_loop_left_shift_group], connection_valid[s][l_idx_loop_left_shift_group]}),
                        .i_data_bus({connection[s][h_idx_loop_left_shift_group], connection[s][l_idx_loop_left_shift_group]}),
                        .o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
                        .o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
                        .i_en(i_en),
                        .i_cmd(cmd_pipeline_stage[s].pipeline_i_cmd_reg[0][group_switch_offset + i])
                    );
                end
            end
        end


        // middle stage -> last stage
        // shuffle function         [loop left shift]:   output of i-th stage    -> input of (i+1)-th stage
        // inverse shuffle function [loop right shift]:  input of (i+1)-th stage -> output of i-th stage
        for(s=(LEVEL-1);s<(TOTAL_STAGE-1);s=s+1)
        begin:second_half_stages
            localparam [$clog2(NUM_INPUT_DATA):0] num_group = TOTAL_STAGE-2-s;
            localparam [$clog2(NUM_INPUT_DATA):0] NUM_GROUP_SEC_HALF = 1 << num_group;
            for(k=0;k<NUM_GROUP_SEC_HALF;k=k+1)
            begin:group_sec_half
                localparam  NUM_SWITCH_IN_GROUP = NUM_SWITCH_IN>>num_group;
                for(i=0;i<NUM_SWITCH_IN_GROUP;i=i+1)
                begin:switch_sec_half
                    // For low input [Loop right Shift (2*i)]
                    // localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] idx = i[$clog2(NUM_INPUT_DATA)-1-num_group:0];
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_switch_offset = k*(NUM_SWITCH_IN>>num_group);
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_offset = k*(NUM_INPUT_DATA>>num_group);
                    localparam                                        MASK =  (1 << ($clog2(NUM_INPUT_DATA)-num_group)) - 1;

                    localparam                                        l_idx = ( i << 1) & MASK;
                    localparam                                        l_idx_right_shift = (l_idx >> 1) & MASK;
                    localparam                                        l_idx_LSB_is_1 = l_idx&1'b1;
                    localparam                                        l_idx_LSB_loop_shift = l_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
                    localparam                                        l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           l_idx_loop_right_shift_group = l_idx_loop_right_shift + group_offset;

                    // For high input [Loop right Shift (2*i+1)]
                    localparam                                        h_idx = ((i << 1) + 1) & MASK;
                    localparam                                        h_idx_right_shift = (h_idx >> 1) & MASK;
                    localparam                                        h_idx_LSB_is_1 = h_idx&1'b1;
                    localparam                                        h_idx_LSB_loop_shift = h_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
                    localparam                                        h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           h_idx_loop_right_shift_group = h_idx_loop_right_shift + group_offset;

                    distribute_2x2_simple_seq #(
                        .DATA_WIDTH(DATA_WIDTH),
                        .COMMAND_WIDTH(COMMAND_WIDTH)
                    ) third_stage(
                        .clk(clk),
                        .rst_n(rst_n),
                        .i_valid({connection_valid[s][h_idx_loop_right_shift_group], connection_valid[s][l_idx_loop_right_shift_group]}),
                        .i_data_bus({connection[s][h_idx_loop_right_shift_group], connection[s][l_idx_loop_right_shift_group]}),
                        .o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
                        .o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
                        .i_en(i_en),
                        .i_cmd(cmd_pipeline_stage[s].pipeline_i_cmd_reg[0][group_switch_offset + i])
                    );
                end
            end
        end


        for(i=0;i<NUM_INPUT_DATA;i=i+1)
        begin: output_data
            assign o_data_bus[i*DATA_WIDTH+:DATA_WIDTH] = connection[TOTAL_STAGE-1][i];
            assign o_valid[i+:1] = connection_valid[TOTAL_STAGE-1][i];
        end

    endgenerate

endmodule
`endif


`ifdef PIPELINE2STAGE // 2 stage pipeline means total 2 cycle latency to go from input to output.
                       // first half and second half are separately different two pipeline stages.
                       // first pipeline stage has 0~2 (3 stages in total)
                       // second pipeline stage has 3~4 (2 stages in total)

// Note: use the SIMPLE_MODULAR version distribute_2x2_simple_seq.
// Need to set "`define SIMPLE_MODULAR in distribute_2x2_simple_seq.v"
module benes_simple_seq#(
    parameter DATA_WIDTH = 32,     // could be arbitrary number
    parameter COMMAND_WIDTH  = 2, // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
    parameter NUM_INPUT_DATA = 8    // multiple be 2^n
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    localparam LEVEL = $clog2(NUM_INPUT_DATA);

    localparam TOTAL_STAGE = 2*LEVEL-1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // 2 stage pipeline parameter
    localparam NUM_PIPELINE_STAGE = 2;
    localparam STAGE_NUM_IN_FIRST_PIPELINE = LEVEL;
    localparam STAGE_NUM_IN_SECOND_PIPELINE = TOTAL_STAGE - LEVEL;

    // interface
    input                                        clk;
    input                                        rst_n;

    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_INPUT_DATA-1:0]                  o_valid;
    output [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                  i_cmd;
                                    // 11 --> Multicast_HighIn
                                    // 00 --> Multicast_LowIn
                                    // 10 --> Pass Through
                                    // 01 --> Pass Switch

    // inner logic
    wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE+1][0:NUM_INPUT_DATA-1];               // two more stages to connect output from the previous pipeline into the input of the next pipeline
    wire                                         connection_valid[0:TOTAL_STAGE+1][0:NUM_INPUT_DATA-1];         // two more stages to connect output from the previous pipeline into the input of the next pipeline

    // logic for control pipeline
    localparam NUM_SWITCH_IN_SECOND_PIPELINE_STAGE = NUM_SWITCH_IN * STAGE_NUM_IN_SECOND_PIPELINE;
    localparam NUM_SWITCH_IN_FIRST_PIPELINE_STAGE = NUM_SWITCH_IN * STAGE_NUM_IN_FIRST_PIPELINE;

    reg    [COMMAND_WIDTH-1:0]                  first_pipeline_i_cmd_reg[0:TOTAL_STAGE-1][0:NUM_SWITCH_IN-1]; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 0 at 2 pipeline stage code.
    reg    [COMMAND_WIDTH-1:0]                  second_pipeline_i_cmd_reg[0:NUM_SWITCH_IN_SECOND_PIPELINE_STAGE-1][0:NUM_SWITCH_IN-1]; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 0 at 2 pipeline stage code.

    reg    [DATA_WIDTH-1:0]                      pipeline_data_bus_reg[0:NUM_PIPELINE_STAGE-1][0:NUM_INPUT_DATA-1];
    reg                                          pipeline_data_valid_reg[0:NUM_PIPELINE_STAGE-1][0:NUM_INPUT_DATA-1];

    genvar i,j,k,s;

    generate
        // initialization for command and pipeline reg
        for(i=0; i<TOTAL_STAGE; i=i+1)
        begin:initialization_first_pipeline_cmd
            for(j=0; j<NUM_SWITCH_IN; j=j+1)
            begin: initialization
                initial
                begin
                    first_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                end
            end
        end

        for(i=0; i<STAGE_NUM_IN_SECOND_PIPELINE; i=i+1)
        begin:initialization_second_pipeline_cmd
            for(j=0; j<NUM_SWITCH_IN; j=j+1)
            begin: initialization
                initial
                begin
                    second_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                end
            end
        end

        for(s=0; s<NUM_PIPELINE_STAGE; s=s+1)
        begin:initialization_pipeline_data
            for(i=0; i<NUM_INPUT_DATA; i=i+1)
            begin:initialization
                initial
                begin
                    pipeline_data_bus_reg[s][i] <= {NUM_INPUT_DATA{1'b0}};
                    pipeline_data_valid_reg[s][i] <= 1'b0;
                end
            end
        end


        // [First pipeline] cmd pipeline
        for(i=0; i<TOTAL_STAGE; i=i+1)
        begin: i_cmd_1st_pipeline
            for(j=0; j<NUM_SWITCH_IN; j=j+1)
            begin: i_cmd_stage
                always@(posedge clk or negedge rst_n)
                begin
                    if(!rst_n)
                    begin
                        first_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                    end
                    else if(i_en)
                    begin
                        first_pipeline_i_cmd_reg[i][j] <= i_cmd[((i*NUM_SWITCH_IN + j)*COMMAND_WIDTH) +: COMMAND_WIDTH ];
                    end
                    else
                    begin
                        first_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                    end
                end
            end
        end


        // [first pipeline] data pipeline
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:first_pipeline_data_assignment
            always@(posedge clk or negedge rst_n)
            begin
                if(!rst_n)
                begin
                    pipeline_data_bus_reg[0][i] <= {DATA_WIDTH{1'b0}};
                    pipeline_data_valid_reg[0][i] <= 1'b0;
                end
                else if(i_en)
                    pipeline_data_bus_reg[0][i] <= i_data_bus[i*DATA_WIDTH+:DATA_WIDTH];
                    pipeline_data_valid_reg[0][i] <= i_valid[i+:1];
                end
                else
                begin
                    pipeline_data_bus_reg[0][i] <= {DATA_WIDTH{1'b0}};
                    pipeline_data_valid_reg[0][i] <= 1'b0;
                end
            end
        end

        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:first_pipeline_data_wire_connection
            assign connection[0][i] = pipeline_data_bus_reg[0][i];
            assign connection_valid[0][i] = pipeline_data_valid_reg[0][i];
        end


        // first stage
        for(i=0; i<NUM_SWITCH_IN; i=i+1)
        begin:first_stage_switch
            distribute_2x2_simple_comb #(
                .DATA_WIDTH(DATA_WIDTH),
                .COMMAND_WIDTH(COMMAND_WIDTH)
            ) first_stage(
                .i_valid({connection_valid[0][2*i+1], connection_valid[0][2*i]}),
                .i_data_bus({connection[0][2*i+1], connection[0][2*i]}),
                .o_valid({connection_valid[1][2*i+1], connection_valid[1][2*i]}),
                .o_data_bus({connection[1][2*i+1], connection[1][2*i]}),
                .i_en(i_en),
                .i_cmd(first_pipeline_i_cmd_reg[0][i])
            );
        end


        // second stage -> middle stage
        // inverse shuffle function [loop right shift]:  output of i-th stage    -> input of (i+1)-th stage
        // shuffle function         [loop left shift]:   input of (i+1)-th stage -> output of i-th stage
        for(s=0;s<LEVEL-1;s=s+1)
        begin:first_half_stages
            for(k=0;k<(1<<s);k=k+1)
            begin:group
                for(i=0;i<(NUM_SWITCH_IN>>s);i=i+1)
                begin:switch
                    // For low input [Loop left Shift (2*i)]
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] idx = i[$clog2(NUM_INPUT_DATA)-1-s:0];
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_switch_offset = k*(NUM_SWITCH_IN>>s);
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_offset = k*(NUM_INPUT_DATA>>s);

                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx = (idx << 1);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_left_shift = (l_idx << 1);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_1 = 1'b1 << ($clog2(NUM_INPUT_DATA)-1-s);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_is_1 = l_idx&l_idx_MSB_1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_loop_shift = l_idx_MSB_is_1 >> ($clog2(NUM_INPUT_DATA)-1-s);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_loop_left_shift = l_idx_MSB_loop_shift + l_idx_left_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   l_idx_loop_left_shift_group = l_idx_loop_left_shift + group_offset;

                    // For high input [Loop left Shift (2*i+1)]
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx = (idx << 1) + 1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_left_shift = h_idx << 1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_1 = 1'b1 << ($clog2(NUM_INPUT_DATA)-1-s);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_is_1 =  h_idx&h_idx_MSB_1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_loop_shift = h_idx_MSB_is_1 >> ($clog2(NUM_INPUT_DATA)-1-s);
                    localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_loop_left_shift = h_idx_MSB_loop_shift + h_idx_left_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]   h_idx_loop_left_shift_group = h_idx_loop_left_shift + group_offset;

                    distribute_2x2_simple_comb #(
                        .DATA_WIDTH(DATA_WIDTH),
                        .COMMAND_WIDTH(COMMAND_WIDTH)
                    ) third_stage(
                        .i_valid({connection_valid[s+1][h_idx_loop_left_shift_group], connection_valid[s+1][l_idx_loop_left_shift_group]}),
                        .i_data_bus({connection[s+1][h_idx_loop_left_shift_group], connection[s+1][l_idx_loop_left_shift_group]}),
                        .o_valid({connection_valid[s+2][2*(i+group_switch_offset)+1], connection_valid[s+2][2*(i+group_switch_offset)]}),
                        .o_data_bus({connection[s+2][2*(i+group_switch_offset)+1], connection[s+2][2*(i+group_switch_offset)]}),
                        .i_en(i_en),
                        .i_cmd(first_pipeline_i_cmd_reg[s+1][group_switch_offset + i])
                    );
                end
            end
        end


        // [Second pipeline] cmd pipeline
        // cmd for the first pipeline also gets propogated, they are redundent logic
        for(i=0; i<STAGE_NUM_IN_SECOND_PIPELINE; i=i+1)
        begin: i_cmd_2nd_pipeline
            for(j=0; j<NUM_SWITCH_IN; j=j+1)
            begin: i_cmd_stage
                always@(posedge clk or negedge rst_n)
                begin
                    if(!rst_n)
                    begin
                        second_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                    end
                    else if(i_en)
                    begin
                        second_pipeline_i_cmd_reg[i][j] <= first_pipeline_i_cmd_reg[i+STAGE_NUM_IN_FIRST_PIPELINE][j];
                    end
                    else
                    begin
                        second_pipeline_i_cmd_reg[i][j] <= {COMMAND_WIDTH{1'b0}};
                    end
                end
            end
        end

        // [Second pipeline] data pipeline
        for(i=0;i<NUM_INPUT_DATA;i=i+1)
        begin:second_pipeline_data_assignment
            always@(posedge clk or negedge rst_n)
            begin
                if(!rst_n)
                begin
                    pipeline_data_bus_reg[1][i] <= {DATA_WIDTH{1'b0}};
                    pipeline_data_valid_reg[1][i] <= 1'b0;  
                end
                else if(i_en)
                begin
                    pipeline_data_bus_reg[1][i] <= connection[STAGE_NUM_IN_FIRST_PIPELINE][i];
                    pipeline_data_valid_reg[1][i] <= connection_valid[STAGE_NUM_IN_FIRST_PIPELINE][i];
                end
                else
                begin
                    pipeline_data_bus_reg[1][i] <= {DATA_WIDTH{1'b0}};
                    pipeline_data_valid_reg[1][i] <= 1'b0;
                end
            end
        end

        for(i=0;i<NUM_INPUT_DATA;i=i+1)
        begin:second_pipeline_data_wire_connection
            assign	connection[STAGE_NUM_IN_FIRST_PIPELINE+1][i] = pipeline_data_bus_reg[1][i];
            assign	connection_valid[STAGE_NUM_IN_FIRST_PIPELINE+1][i] = pipeline_data_valid_reg[1][i];
        end



        // middle stage -> last stage
        // shuffle function         [loop left shift]:   output of i-th stage    -> input of (i+1)-th stage
        // inverse shuffle function [loop right shift]:  input of (i+1)-th stage -> output of i-th stage
        for(s=(LEVEL-1);s<(TOTAL_STAGE-1);s=s+1)
        begin:second_half_stages
            localparam [$clog2(NUM_INPUT_DATA):0] num_group = TOTAL_STAGE-2-s;
            for(k=0;k<(1<<num_group);k=k+1)
            begin:group
                for(i=0;i<(NUM_SWITCH_IN>>num_group);i=i+1)
                begin:switch
                    // For low input [Loop right Shift (2*i)]
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] idx = i[$clog2(NUM_INPUT_DATA)-1-num_group:0];
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_switch_offset = k*(NUM_SWITCH_IN>>num_group);
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_offset = k*(NUM_INPUT_DATA>>num_group);

                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx = (idx << 1);
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_right_shift = l_idx >> 1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_LSB_is_1 = l_idx&1'b1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_LSB_loop_shift = l_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           l_idx_loop_right_shift_group = l_idx_loop_right_shift + group_offset;

                    // For high input [Loop right Shift (2*i+1)]
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx = (idx << 1) + 1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_right_shift = h_idx >> 1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_LSB_is_1 = h_idx&1'b1;
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_LSB_loop_shift = h_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
                    localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;
                    localparam [$clog2(NUM_INPUT_DATA)-1:0]           h_idx_loop_right_shift_group = h_idx_loop_right_shift + group_offset;

                    distribute_2x2_simple_comb #(
                        .DATA_WIDTH(DATA_WIDTH),
                        .COMMAND_WIDTH(COMMAND_WIDTH)
                    ) third_stage(
                        .i_valid({connection_valid[s+2][h_idx_loop_right_shift_group], connection_valid[s+2][l_idx_loop_right_shift_group]}),
                        .i_data_bus({connection[s+2][h_idx_loop_right_shift_group], connection[s+2][l_idx_loop_right_shift_group]}),
                        .o_valid({connection_valid[s+3][2*(i+group_switch_offset)+1], connection_valid[s+3][2*(i+group_switch_offset)]}),
                        .o_data_bus({connection[s+3][2*(i+group_switch_offset)+1], connection[s+3][2*(i+group_switch_offset)]}),
                        .i_en(i_en),
                        .i_cmd(second_pipeline_i_cmd_reg[s-(LEVEL-1)][group_switch_offset + i])
                    );
                end
            end
        end


        for(i=0;i<NUM_INPUT_DATA;i=i+1)
        begin: output_data
            assign o_data_bus[i*DATA_WIDTH+:DATA_WIDTH] = connection[TOTAL_STAGE+1][i];  // two more stages to access the final output
            assign o_valid[i+:1] = connection_valid[TOTAL_STAGE+1][i];                   // two more stages to access the final output
        end

    endgenerate


endmodule
`endif
