import sys, getopt
"""
    The script could automatically add buffers chain to 
    the paths that violate the holding time rule.
    Now support "top half" of ddnoc design. 

    The script takes two inputs:
    1: transcript from modelsim
    2: post_pnr RTL

    usage: python3 auto_buffer_chain_adder.py -i ./progress_doc/transcript_modelsim -r ./post_pnr_netlists/test.v

    author: Jianming TONG (jianming.tong@gatech.edu)
"""

unique_path_list = []
transcript_modelsim=""
post_PNR_RTL=""

def get_paths_violating_holding_time():
    # err_log = open("./progress_doc/transcript_modelsim")
    err_log = open(transcript_modelsim)
    lines = err_log.readlines()
    readline = False
    path_list = []
    for line in lines:
        if readline:
            reg_hier = line.split(": ")[-1]
            if "ddnoc" in reg_hier and "half" in reg_hier and "wire_pipeline" in reg_hier:
                tmp_split_rst = reg_hier.split("/")
                path_list.append(("wire_binary_tree_1_8_seq_DATA_WIDTH32_NUM_OUTPUT_DATA8_NUM_INPUT_DATA1_" + tmp_split_rst[-2].split("__")[0].split("_")[-1], tmp_split_rst[-1].split("\n")[0] ))
                readline = False
        if "$hold" in line:
            readline = True
    path_list.sort()
    unique_path_list.append(path_list[0])
    for i in range(len(path_list)-1):
        if path_list[i] != path_list[i+1]:
             unique_path_list.append(path_list[i+1])
    # print(unique_path_list)
    err_log.close()


def add_extra_line():
    ftest = open("./test_line_insert.v","a")
    for i in range(10):
        ftest.write(f"wire {i}\n")
    ftest.write(f"\n")
    ftest.write(f"\n")
    ftest.close()
    ftest = open("./test_line_insert.v")
    lines = ftest.readlines()
    id = 0
    for idx, line in enumerate(lines):
        if "wire" in line and "wire" not in lines[idx+1]:
        # if "1" in line and "2" in lines[idx+1]:
            print("find ")
            id= idx+1
            break
    
    ftest.close()
    ftest = open("./test_line_insert.v","w")
    lines[id-1] = "new\n"
    lines.insert(id,"insert\n")
    lines.insert(id+3,"insert\n")
    # for line in lines:
    ftest.writelines(lines)

def add_buffer_in_post_PNR_RTL():
    for single_path in unique_path_list:
        # post_pnr_rtl = open("./post_pnr_netlists/test.v")
        post_pnr_rtl = open(post_PNR_RTL)

        # get original wire name, e.g. N411
        # get idx of wire
        # get  of wire
        lines = post_pnr_rtl.readlines()
        path_list = []
        module_line_id = 0
        end_module_line_id = 0
        wire_def_line_id = 0
        reg_line_id = 0
        buf_name_prefix = 0
        detect_module = False
        finish_detect_module = False
        module_name = "module "+single_path[0]
        for idx, line in enumerate(lines):
            if module_name in line:
                if not detect_module:
                    module_line_id = idx
                    detect_module = True
                    # print(module_line_id, line)

            if "endmodule" in line:
                if detect_module:
                    if not finish_detect_module:
                        end_module_line_id = idx
                        finish_detect_module = True
                        # print(end_module_line_id, line)

        # detect the last wire definition
        for idx, line in enumerate(lines[module_line_id:end_module_line_id]):
            if "wire " in line:
                if "wire " not in lines[idx+module_line_id+1]:
                    wire_def_line_id = idx + module_line_id+1 
                    # print(wire_def_line_id, line, lines[idx+module_line_id+1])
                    break

        # detect the location of reg that violates the holding time
        for idx, line in enumerate(lines[module_line_id:end_module_line_id]):
            if single_path[1] in line:
                buf_name_prefix = lines[idx+module_line_id+1].split("(")[-1].split(")")[0]
                reg_line_id = idx +module_line_id
                # print(reg_line_id, line)
                break
        
        lines[reg_line_id+1] = f"	.D({buf_name_prefix}_{wire_def_line_id}_buf4),\n"
        post_pnr_rtl.close()
        # post_pnr_rtl = open("./post_pnr_netlists/test.v", "w")
        post_pnr_rtl = open(post_PNR_RTL, "w")

        lines.insert(reg_line_id, f"   BUFFD0BWP30P140LVT UI_hold_{buf_name_prefix}_{wire_def_line_id}_4 (.I({buf_name_prefix}_{wire_def_line_id}_buf3), .Z({buf_name_prefix}_{wire_def_line_id}_buf4));\n")
        lines.insert(reg_line_id, f"   BUFFD0BWP30P140LVT UI_hold_{buf_name_prefix}_{wire_def_line_id}_3 (.I({buf_name_prefix}_{wire_def_line_id}_buf2), .Z({buf_name_prefix}_{wire_def_line_id}_buf3));\n")
        lines.insert(reg_line_id, f"   BUFFD0BWP30P140LVT UI_hold_{buf_name_prefix}_{wire_def_line_id}_2 (.I({buf_name_prefix}_{wire_def_line_id}_buf1), .Z({buf_name_prefix}_{wire_def_line_id}_buf2));\n")
        lines.insert(reg_line_id, f"   BUFFD0BWP30P140LVT UI_hold_{buf_name_prefix}_{wire_def_line_id}_1 (.I({buf_name_prefix}), .Z({buf_name_prefix}_{wire_def_line_id}_buf1));\n")

        lines.insert(wire_def_line_id, f"   wire {buf_name_prefix}_{wire_def_line_id}_buf4;\n")
        lines.insert(wire_def_line_id, f"   wire {buf_name_prefix}_{wire_def_line_id}_buf3;\n")
        lines.insert(wire_def_line_id, f"   wire {buf_name_prefix}_{wire_def_line_id}_buf2;\n")
        lines.insert(wire_def_line_id, f"   wire {buf_name_prefix}_{wire_def_line_id}_buf1;\n")

        # get original wire name, e.g. N411
        post_pnr_rtl.writelines(lines)
        post_pnr_rtl.close()


def usage():
    print("-i <path to transcript_modelsim>\n")     
    print("-r <path to post PNR RTL file>\n")     

if __name__ == "__main__":
    opts, args = getopt.getopt(sys.argv[1:], "hi:r:")

    for op, value in opts:
        if op == "-i":
            transcript_modelsim = value
        elif op == "-r":
            post_PNR_RTL = value
        elif op == "-h":
            usage()

    get_paths_violating_holding_time()
    add_buffer_in_post_PNR_RTL()
    # add_extra_line()