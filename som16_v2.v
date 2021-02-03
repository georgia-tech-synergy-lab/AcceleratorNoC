// *********************************************************************************
// Project Name : SOM for DAC2020
// Create Time  : 2019/11/16 17:11
// File Name    : som128.v
// Module Name  : som128
// Abstract     : som128 with all combiantion logic
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2019/11/16    Zongpc           1.0                    First Create
// 17:11
// *********************************************************************************
`timescale      1ns/1ps 

module som16_v2
#(
    parameter      data_width = 8,
    parameter      switchs_cnt = 8,
    parameter      port_cnt = 16,
    parameter      layer_cnt = 7
)

(
    input           clk,
    input           enable,
    input           sort_en,
    /*
    0: low block into benes
    1: 2 blocks use 128-benes
    2: 2 blocks use 2 64-som
    3: don't use benes
    */
    input   wire    [data_width*port_cnt-1:0]   data_in,
    input   wire    [12*switchs_cnt-1:0] Switch_sig,
    input   wire    [switchs_cnt*(layer_cnt+1)/2-1:0] Broad_sig,
    output  wire    [data_width*port_cnt-1:0]   data_out,
    output  wire    [12*switchs_cnt-1:0] Status_sig
);
    wire [data_width-1:0] data_lf_in[0:port_cnt-1];
    wire [data_width-1:0] data_lg_in[0:port_cnt-1];
    reg  [data_width-1:0] data_lg_reg[0:port_cnt-1];

    wire [data_width-1:0] data_lh_in[0:port_cnt-1];
    wire [data_width-1:0] data_li_in[0:port_cnt-1];
    reg  [data_width-1:0] data_li_reg[0:port_cnt-1];

    wire [data_width-1:0] data_lj1_in[0:port_cnt-1];
    wire [data_width-1:0] data_lj2_in[0:port_cnt-1];
    wire [data_width-1:0] data_lj_in[0:port_cnt-1];
    reg  [data_width-1:0] data_lj_reg[0:port_cnt-1];

    wire [data_width-1:0] data_lk1_in[0:port_cnt-1];
    wire [data_width-1:0] data_lk2_in[0:port_cnt-1];
    wire [data_width-1:0] data_lk3_in[0:port_cnt-1];
    wire [data_width-1:0] data_lk_in[0:port_cnt-1];
    reg  [data_width-1:0] data_out_reg[0:port_cnt-1];
    
    wire [data_width-1:0] data_in_wire[0:port_cnt-1];
    wire [data_width-1:0] data_le[0:port_cnt-1];
    wire [data_width-1:0] data_lf[0:port_cnt-1];
    wire [data_width-1:0] data_lg[0:port_cnt-1];
    wire [data_width-1:0] data_lh[0:port_cnt-1];
    wire [data_width-1:0] data_li[0:port_cnt-1];
    wire [data_width-1:0] data_lj1[0:port_cnt-1];
    wire [data_width-1:0] data_lj2[0:port_cnt-1];
    wire [data_width-1:0] data_lj[0:port_cnt-1];
    wire [data_width-1:0] data_lk1[0:port_cnt-1];
    wire [data_width-1:0] data_lk2[0:port_cnt-1];
    wire [data_width-1:0] data_lk3[0:port_cnt-1];
    wire [data_width-1:0] data_lk[0:port_cnt-1];
    reg [data_width-1:0] data_lk_reg[0:port_cnt-1];

    integer i,j;
//***************************ImportData*******************************//
    generate
        genvar v_in;
        for (v_in = 0; v_in < port_cnt; v_in = v_in + 1) begin : ImportData
            assign data_in_wire[v_in] = data_in[(v_in+1)*data_width-1:v_in*data_width];
        end    
    endgenerate

//***************************ExportData*******************************//
    generate
        genvar v_out;
        for (v_out = 0; v_out < port_cnt; v_out = v_out + 1) begin : ExportData
            assign data_out[(v_out+1)*data_width-1:v_out*data_width] = data_out_reg[v_out];
        end    
    endgenerate


//***************************layer_e*******************************//
    generate
        genvar ve;        
        for (ve = 0; ve < switchs_cnt; ve = ve + 1) begin : le_inst
            om_element #(data_width) le_ome_inst (Switch_sig[ve],
                                                  Broad_sig[ve],
                                                  data_in_wire[2*ve],
                                                  data_in_wire[2*ve+1],
                                                  data_le[2*ve],
                                                  data_le[2*ve+1],
                                                  Status_sig[ve]);
        end
    endgenerate

//**********************layer_e->layer_f***************************//
    generate
        genvar i_e2f,j_e2f;
        for (i_e2f = 0; i_e2f < 2; i_e2f = i_e2f + 1) begin : le2lf_inst_a
            for (j_e2f = 0; j_e2f < switchs_cnt; j_e2f = j_e2f + 1) begin : le2lf_inst_b
                assign data_lf_in[j_e2f+i_e2f*switchs_cnt] = data_le[j_e2f*2+i_e2f];
            end
        end
    endgenerate

//***************************layer_f*******************************//
    generate
        genvar vf;        
        for (vf = 0; vf < switchs_cnt; vf = vf + 1) begin : lf_inst
            om_element #(data_width) lf_ome_inst (Switch_sig[vf+switchs_cnt],
                                                  Broad_sig[vf+switchs_cnt],
                                                  data_lf_in[2*vf],
                                                  data_lf_in[2*vf+1],
                                                  data_lf[2*vf],
                                                  data_lf[2*vf+1],
                                                  Status_sig[vf+switchs_cnt]);
        end
    endgenerate

//**********************layer_f->layer_g***************************//
    generate
        genvar i_f2g,j_f2g;
        for (i_f2g = 0; i_f2g < 4; i_f2g = i_f2g + 1) begin : lf2lg_inst_a
            for (j_f2g = 0; j_f2g < switchs_cnt/2; j_f2g = j_f2g + 1) begin : lf2lg_inst_b
                assign data_lg_in[j_f2g+i_f2g*switchs_cnt/2] = data_lf[j_f2g*2+i_f2g[0]+(i_f2g>>1)*switchs_cnt];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(enable) begin
            if (sort_en) begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lg_reg[i] <= data_in_wire[i];
                end
            end
            else begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lg_reg[i] <= data_lg_in[i];
                end
            end
        end 
        else begin
            for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lg_reg[i] <= {data_width{1'b0}};
            end
        end
    end

//***************************layer_g*******************************//
    generate
        genvar vg;        
        for (vg = 0; vg < switchs_cnt; vg = vg + 1) begin : lg_inst
            if(vg[0]) begin : lg_u2d
                som_u2d_element #(data_width) lg_some_u2d_inst (Switch_sig[vg+switchs_cnt*2],
                                                                Broad_sig[vg+switchs_cnt*2],
                                                                sort_en,
                                                                data_lg_reg[2*vg],
                                                                data_lg_reg[2*vg+1],
                                                                data_lg[2*vg],
                                                                data_lg[2*vg+1],
                                                                Status_sig[vg+switchs_cnt*2]);
            end
            else begin : lg_d2u
                som_d2u_element #(data_width) lg_some_d2u_inst (Switch_sig[vg+switchs_cnt*2],
                                                                Broad_sig[vg+switchs_cnt*2],
                                                                sort_en,
                                                                data_lg_reg[2*vg],
                                                                data_lg_reg[2*vg+1],
                                                                data_lg[2*vg],
                                                                data_lg[2*vg+1],
                                                                Status_sig[vg+switchs_cnt*2]);
            end
        end
    endgenerate

//**********************layer_g->layer_h***************************//
    generate
        genvar i_g2h,j_g2h;
        for (i_g2h = 0; i_g2h < 8; i_g2h = i_g2h + 1) begin : lg2lh_inst_a
            for (j_g2h = 0; j_g2h < switchs_cnt/4; j_g2h = j_g2h + 1) begin : lg2lh_inst_b
                assign data_lh_in[j_g2h+i_g2h*switchs_cnt/4] = data_lg[j_g2h*2+i_g2h[0]+(i_g2h>>1)*switchs_cnt/2];
            end
        end
    endgenerate

//***************************layer_h*******************************//
    generate
        genvar vh;        
        for (vh = 0; vh < switchs_cnt; vh = vh + 1) begin : lh_inst
            if(vh[1]) begin : lh_u2d
                som_u2d_element #(data_width) lh_some_u2d_inst (Switch_sig[vh+switchs_cnt*3],
                                                                Broad_sig[vh+switchs_cnt*3],
                                                                sort_en,
                                                                data_lh_in[2*vh],
                                                                data_lh_in[2*vh+1],
                                                                data_lh[2*vh],
                                                                data_lh[2*vh+1],
                                                                Status_sig[vh+switchs_cnt*3]);
            end
            else begin : lh_d2u
                som_d2u_element #(data_width) lh_some_d2u_inst (Switch_sig[vh+switchs_cnt*3],
                                                                Broad_sig[vh+switchs_cnt*3],
                                                                sort_en,
                                                                data_lh_in[2*vh],
                                                                data_lh_in[2*vh+1],
                                                                data_lh[2*vh],
                                                                data_lh[2*vh+1],
                                                                Status_sig[vh+switchs_cnt*3]);
            end
        end
    endgenerate

//**********************layer_h->layer_i***************************//
    generate
        genvar i_h2i,j_h2i;
        for (i_h2i = 0; i_h2i < 8; i_h2i = i_h2i + 1) begin : lh2li_inst_a
            for (j_h2i = 0; j_h2i < switchs_cnt/4; j_h2i = j_h2i + 1) begin : lh2li_inst_b
                assign data_li_in[j_h2i*2+i_h2i[0]+(i_h2i>>1)*switchs_cnt/2] = data_lh[j_h2i+i_h2i*switchs_cnt/4];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(enable) begin
            for (i = 0; i < port_cnt; i = i + 1) begin
                data_li_reg[i] <= data_li_in[i];
            end
        end 
        else begin
            for (i = 0; i < port_cnt; i = i + 1) begin
                 data_li_reg[i] <= {data_width{1'b0}};
            end
        end
    end

//***************************layer_i*******************************//
    generate
        genvar vi;        
        for (vi = 0; vi < switchs_cnt; vi = vi + 1) begin : li_inst
            if(vi[1]) begin : li_u2d
                so_u2d_element #(data_width) li_soe_u2d_inst (Switch_sig[vi+switchs_cnt*4],
                                                              sort_en,
                                                              data_li_reg[2*vi],
                                                              data_li_reg[2*vi+1],
                                                              data_li[2*vi],
                                                              data_li[2*vi+1],
                                                              Status_sig[vi+switchs_cnt*4]);
            end
            else begin : li_d2u
                so_d2u_element #(data_width) li_soe_d2u_inst (Switch_sig[vi+switchs_cnt*4],
                                                              sort_en,
                                                              data_li_reg[2*vi],
                                                              data_li_reg[2*vi+1],
                                                              data_li[2*vi],
                                                              data_li[2*vi+1],
                                                              Status_sig[vi+switchs_cnt*4]);
            end
        end
    endgenerate

//**********************layer_i->layer_j1***************************//
    generate
        genvar i_i_j1,j_i_j1;
        for (i_i_j1 = 0; i_i_j1 < 4; i_i_j1 = i_i_j1 + 1) begin : li_lj1_inst_a
            for (j_i_j1 = 0; j_i_j1 < switchs_cnt/2; j_i_j1 = j_i_j1 + 1) begin : li_lj1_inst_b
                assign data_lj1_in[j_i_j1*2+i_i_j1[0]+(i_i_j1>>1)*switchs_cnt] = data_li[j_i_j1+i_i_j1*switchs_cnt/2];
            end
        end
    endgenerate

//***************************layer_j1*******************************//
    generate
        genvar vj1;        
        for (vj1 = 0; vj1 < switchs_cnt; vj1 = vj1 + 1) begin : lj1_inst
            if(vj1[2]) begin : lj1_u2d
                so_u2d_element #(data_width) lj1_se_u2d_inst (Switch_sig[vj1+switchs_cnt*5],
                                                              sort_en,
                                                              data_lj1_in[2*vj1],
                                                              data_lj1_in[2*vj1+1],
                                                              data_lj1[2*vj1],
                                                              data_lj1[2*vj1+1],
                                                              Status_sig[vj1+switchs_cnt*5]);
            end
            else begin : lj1_d2u
                so_d2u_element #(data_width) lj1_se_d2u_inst (Switch_sig[vj1+switchs_cnt*5],
                                                              sort_en,
                                                              data_lj1_in[2*vj1],
                                                              data_lj1_in[2*vj1+1],
                                                              data_lj1[2*vj1],
                                                              data_lj1[2*vj1+1],
                                                              Status_sig[vj1+switchs_cnt*5]);
            end
        end
    endgenerate

//**********************layer_j1->layer_j2***************************//
    generate
        genvar i_j1_j2,j_j1_j2;
        for (i_j1_j2 = 0; i_j1_j2 < 4; i_j1_j2 = i_j1_j2 + 1) begin : lj1_lj2_inst_a
            for (j_j1_j2 = 0; j_j1_j2 < switchs_cnt/2; j_j1_j2 = j_j1_j2 + 1) begin : lj1_lj2_inst_b
                assign data_lj2_in[j_j1_j2*2+i_j1_j2[0]+(i_j1_j2>>1)*switchs_cnt] = data_lj1[j_j1_j2+i_j1_j2*switchs_cnt/2];
            end
        end
    endgenerate

//***************************layer_j2*******************************//
    generate
        genvar vj2;        
        for (vj2 = 0; vj2 < switchs_cnt; vj2 = vj2 + 1) begin : lj2_inst
            if(vj2[2]) begin : lj2_u2d
                so_u2d_element #(data_width) lj2_se_u2d_inst (Switch_sig[vj2+switchs_cnt*6],
                                                              sort_en,
                                                              data_lj2_in[2*vj2],
                                                              data_lj2_in[2*vj2+1],
                                                              data_lj2[2*vj2],
                                                              data_lj2[2*vj2+1],
                                                              Status_sig[vj2+switchs_cnt*6]);
            end
            else begin : lj2_d2u
                so_d2u_element #(data_width) lj2_se_d2u_inst (Switch_sig[vj2+switchs_cnt*6],
                                                              sort_en,
                                                              data_lj2_in[2*vj2],
                                                              data_lj2_in[2*vj2+1],
                                                              data_lj2[2*vj2],
                                                              data_lj2[2*vj2+1],
                                                              Status_sig[vj2+switchs_cnt*6]);
            end
        end
    endgenerate

//**********************layer_j2->layer_j***************************//
    generate
        genvar i_j2_j,j_j2_j;
        for (i_j2_j = 0; i_j2_j < 4; i_j2_j = i_j2_j + 1) begin : lj2_lj_inst_a
            for (j_j2_j = 0; j_j2_j < switchs_cnt/2; j_j2_j = j_j2_j + 1) begin : lj2_lj_inst_b
                assign data_lj_in[j_j2_j*2+i_j2_j[0]+(i_j2_j>>1)*switchs_cnt] = data_lj2[j_j2_j+i_j2_j*switchs_cnt/2];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(enable) begin
            if (sort_en) begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lj_reg[i] <= data_lj_in[i];
                end
            end
            else begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lj_reg[i] <= data_lj1_in[i];
                end
            end
        end 
        else begin
            for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lj_reg[i] <= {data_width{1'b0}};
            end
        end
    end
//***************************layer_j*******************************//
    generate
        genvar vj;        
        for (vj = 0; vj < switchs_cnt; vj = vj + 1) begin : lj_inst
            if(vj[2]) begin : lj_u2d
                so_u2d_element #(data_width) lj_soe_u2d_inst (Switch_sig[vj+switchs_cnt*7],
                                                              sort_en,
                                                              data_lj_reg[2*vj],
                                                              data_lj_reg[2*vj+1],
                                                              data_lj[2*vj],
                                                              data_lj[2*vj+1],
                                                              Status_sig[vj+switchs_cnt*7]);
            end
            else begin : lj_d2u
                so_d2u_element #(data_width) lj_soe_d2u_inst (Switch_sig[vj+switchs_cnt*7],
                                                              sort_en,
                                                              data_lj_reg[2*vj],
                                                              data_lj_reg[2*vj+1],
                                                              data_lj[2*vj],
                                                              data_lj[2*vj+1],
                                                              Status_sig[vj+switchs_cnt*7]);
            end
        end
    endgenerate

//**********************layer_j->layer_k1***************************//
    generate
        genvar i_j_k1,j_j_k1;
        for (i_j_k1 = 0; i_j_k1 < 2; i_j_k1 = i_j_k1 + 1) begin : lj_lk1_inst_a
            for (j_j_k1 = 0; j_j_k1 < switchs_cnt; j_j_k1 = j_j_k1 + 1) begin : lj_lk1_inst_b
                assign data_lk1_in[j_j_k1*2+i_j_k1] = data_lj[j_j_k1+i_j_k1*switchs_cnt];
            end
        end
    endgenerate

//***************************layer_k1*******************************//
    generate
        genvar vk1;        
        for (vk1 = 0; vk1 < switchs_cnt; vk1 = vk1 + 1) begin : lk1_inst
            if(vk1[3]) begin : lk1_u2d
                so_u2d_element #(data_width) lk1_se_u2d_inst (Switch_sig[vk1+switchs_cnt*8],
                                                              sort_en,
                                                              data_lk1_in[2*vk1],
                                                              data_lk1_in[2*vk1+1],
                                                              data_lk1[2*vk1],
                                                              data_lk1[2*vk1+1],
                                                              Status_sig[vk1+switchs_cnt*8]);
            end
            else begin : lk1_d2u
                so_d2u_element #(data_width) lk1_se_d2u_inst (Switch_sig[vk1+switchs_cnt*8],
                                                              sort_en,
                                                              data_lk1_in[2*vk1],
                                                              data_lk1_in[2*vk1+1],
                                                              data_lk1[2*vk1],
                                                              data_lk1[2*vk1+1],
                                                              Status_sig[vk1+switchs_cnt*8]);
            end
        end
    endgenerate

//**********************layer_k1->layer_k2***************************//
    generate
        genvar i_k1_k2,j_k1_k2;
        for (i_k1_k2 = 0; i_k1_k2 < 2; i_k1_k2 = i_k1_k2 + 1) begin : lk1_lk2_inst_a
            for (j_k1_k2 = 0; j_k1_k2 < switchs_cnt; j_k1_k2 = j_k1_k2 + 1) begin : lk1_lk2_inst_b
                assign data_lk2_in[j_k1_k2*2+i_k1_k2] = data_lk1[j_k1_k2+i_k1_k2*switchs_cnt];
            end
        end
    endgenerate

//***************************layer_k2*******************************//
    generate
        genvar vk2;        
        for (vk2 = 0; vk2 < switchs_cnt; vk2 = vk2 + 1) begin : lk2_inst
            if(vk2[3]) begin : lk2_u2d
                so_u2d_element #(data_width) lk2_se_u2d_inst (Switch_sig[vk2+switchs_cnt*9],
                                                              sort_en,
                                                              data_lk2_in[2*vk2],
                                                              data_lk2_in[2*vk2+1],
                                                              data_lk2[2*vk2],
                                                              data_lk2[2*vk2+1],
                                                              Status_sig[vk2+switchs_cnt*9]);
            end
            else begin : lk2_d2u
                so_d2u_element #(data_width) lk2_se_d2u_inst (Switch_sig[vk2+switchs_cnt*9],
                                                              sort_en,
                                                              data_lk2_in[2*vk2],
                                                              data_lk2_in[2*vk2+1],
                                                              data_lk2[2*vk2],
                                                              data_lk2[2*vk2+1],
                                                              Status_sig[vk2+switchs_cnt*9]);
            end
        end
    endgenerate

//**********************layer_k2->layer_k3***************************//
    generate
        genvar i_k2_k3,j_k2_k3;
        for (i_k2_k3 = 0; i_k2_k3 < 2; i_k2_k3 = i_k2_k3 + 1) begin : lk2_lk3_inst_a
            for (j_k2_k3 = 0; j_k2_k3 < switchs_cnt; j_k2_k3 = j_k2_k3 + 1) begin : lk2_lk3_inst_b
                assign data_lk3_in[j_k2_k3*2+i_k2_k3] = data_lk2[j_k2_k3+i_k2_k3*switchs_cnt];
            end
        end
    endgenerate

//***************************layer_k3*******************************//
    generate
        genvar vk3;        
        for (vk3 = 0; vk3 < switchs_cnt; vk3 = vk3 + 1) begin : lk3_inst
            if(vk3[3]) begin : lk3_u2d
                so_u2d_element #(data_width) lk3_se_u2d_inst (Switch_sig[vk3+switchs_cnt*10],
                                                              sort_en,
                                                              data_lk3_in[2*vk3],
                                                              data_lk3_in[2*vk3+1],
                                                              data_lk3[2*vk3],
                                                              data_lk3[2*vk3+1],
                                                              Status_sig[vk3+switchs_cnt*10]);
            end
            else begin : lk3_d2u
                so_d2u_element #(data_width) lk3_se_d2u_inst (Switch_sig[vk3+switchs_cnt*10],
                                                              sort_en,
                                                              data_lk3_in[2*vk3],
                                                              data_lk3_in[2*vk3+1],
                                                              data_lk3[2*vk3],
                                                              data_lk3[2*vk3+1],
                                                              Status_sig[vk3+switchs_cnt*10]);
            end
        end
    endgenerate

//**********************layer_k3->layer_k***************************//
    generate
        genvar i_k3_k,j_k3_k;
        for (i_k3_k = 0; i_k3_k < 2; i_k3_k = i_k3_k + 1) begin : _k3_lk_inst_a
            for (j_k3_k = 0; j_k3_k < switchs_cnt; j_k3_k = j_k3_k + 1) begin : _k3_lk_inst_b
                assign data_lk_in[j_k3_k*2+i_k3_k] = data_lk3[j_k3_k+i_k3_k*switchs_cnt];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(enable) begin
            if (sort_en) begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lk_reg[i] <= data_lk_in[i];
                end
            end
            else begin
                for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lk_reg[i] <= data_lk1_in[i];
                end
            end
        end 
        else begin
            for (i = 0; i < port_cnt; i = i + 1) begin
                 data_lk_reg[i] <= {data_width{1'b0}};
            end
        end
    end

//***************************layer_k*******************************//
    generate
        genvar vk;        
        for (vk = 0; vk < switchs_cnt; vk = vk + 1) begin : lk_inst
            if(vk[3]) begin : lk_u2d
                so_u2d_element #(data_width) lk_soe_u2d_inst (Switch_sig[vk+switchs_cnt*11],
                                                              sort_en,
                                                              data_lk_reg[2*vk],
                                                              data_lk_reg[2*vk+1],
                                                              data_lk[2*vk],
                                                              data_lk[2*vk+1],
                                                              Status_sig[vk+switchs_cnt*11]);
            end
            else begin : lk_d2u
                so_d2u_element #(data_width) lk_soe_d2u_inst (Switch_sig[vk+switchs_cnt*11],
                                                              sort_en,
                                                              data_lk_reg[2*vk],
                                                              data_lk_reg[2*vk+1],
                                                              data_lk[2*vk],
                                                              data_lk[2*vk+1],
                                                              Status_sig[vk+switchs_cnt*11]);
            end
        end
    endgenerate

always @(posedge clk) begin
    if(enable) begin
        for (j = 0; j < port_cnt; j = j + 1) begin
            data_out_reg[j] <= data_lk[j];
        end
    end
    else begin
        for (j = 0; j < port_cnt; j = j + 1) begin
            data_out_reg[j]<= {data_width{1'b0}};
        end
    end
end


endmodule