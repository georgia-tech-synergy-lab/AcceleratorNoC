/*
    Top Module:  tb_arbitor_last_served_2req
    Data:        1 bit request signal
    Timing:      Combinational Logic

    Function:    bydefault output  {1'b0}. Only support 2 req.
    Note:        Grant has no meaning when both Req are 0.
                                     ________
                                     \       \
           req A -------->[not]------>|       |--------> Grant
                                 ---->|       |    |
                                 |   /______ /     |
                     _______     |      OR         |
                    |       \    |                 |
         req B ---->|        |------> out_and      |
          -->[not]->|        |                     |
          |         |_______/                      |
          |            AND                         |
          |                                        |
       |¯¯¯¯|                                      |
       |    |<--------------------------------------
       | /\ |
       |/__\|
     Last Used Reg

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module tb_arbitor_last_served_2req();
    parameter NUM_REQ  = 2;

    // timing signals
    reg                            clk;
    reg                            rst_n;

    // data signals
    reg                            i_valid;        // valid input data signal
    reg    [NUM_REQ-1:0]           i_req_bus;      // input data bus coming into arbiter

    wire                           o_valid;        // output valid
    wire                           o_grant_b;      // output grant

    // control signals
    reg                            i_en;           // module enable

    // inner test
    reg                            req_a;
    reg                            req_b;

    // Test case declaration
    initial
    begin
        clk = 1'b0;
        rst_n = 1'b1;
        // i_req_bus = {req_b,req_a};

        // don't enable
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b0;

        // reset
        #10
        rst_n = 1'b0;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        // default: previous grant A; A doesn't request; B request -> should grant B output 1; valid
        #10
        rst_n = 1'b1;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        // previous grant B; A request; B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant A; both A & B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;


        //  previous grant B; both A & B request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant A; A request, B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant A; both A & B don't request -> should output 0; invalid doesn't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant B; A request, B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        //  previous grant B; both A & B don't request -> should output 0; invalid -> don't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;

        // disable -> should output z; invalid -> don't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b0;

        // reset after enable
        #10
        rst_n = 1'b1;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;


        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        rst_n = 1'b0;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        $stop;
end


    // instantiate DUT (device under test)
    arbitor_last_served_2req dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_req_bus(i_req_bus),
        .o_valid(o_valid),
        .o_grant_b(o_grant_b),
        .i_en(i_en)
    );

    always#5 clk=~clk;

endmodule