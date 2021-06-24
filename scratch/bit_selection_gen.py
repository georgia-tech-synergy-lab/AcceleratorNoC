import os

if __name__ == "__main__":
    f = open("bit_selection_gen","w")
    
    for i in range(8):
        f.write("                        3'h"+str(i)+":\n")
        f.write("                        begin\n")
        f.write(f"                            o_data_bus_reg <= i_data_bus[{i+1}+:OUT_DATA_WIDTH];\n")
        f.write(f"                        end\n")

    f.write("\n\n\n\n\n")
    list = ["0","1",'2','3','4','5','6','7','8','9','A','B','C','D','E','F']
    for i in range(16):
        f.write("                        4'h"+str(list[i])+":\n")
        f.write("                        begin\n")
        f.write(f"                            o_data_bus_reg <= i_data_bus[{i+1}+:OUT_DATA_WIDTH];\n")
        f.write(f"                        end\n")