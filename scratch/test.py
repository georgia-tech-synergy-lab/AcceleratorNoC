import os

if __name__ == "__main__":
    f = open("cmd","w")
    for i in range(127,0,-1):
        f.write(f"i_cmd[{i}*NUM_OUTPUT_DATA+i],")
    cmd = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    
    for i in range(127):
        tmp_cmd = list(cmd)
        tmp_cmd[127-i] = '1'
        tmp_cmd=''.join(tmp_cmd)
        f.write("                        128'b"+tmp_cmd+":\n")
        f.write("                        begin\n")
        f.write(f"                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[{i}])?i_data_bus[{i}*DATA_WIDTH+:DATA_WIDTH]:" +"{DATA_WIDTH{1'b0}};\n")
        f.write(f"                        end\n")

    for i in range(127):
        tmp_cmd = list(cmd)
        tmp_cmd[127-i] = '1'
        tmp_cmd=''.join(tmp_cmd)
        f.write("                        128'b"+tmp_cmd+":\n")
        f.write("                        begin\n")
        f.write(f"                            o_valid_reg[i] <= (i_valid[{i}])?1'b1:1'b0;\n")
        f.write(f"                        end\n")
