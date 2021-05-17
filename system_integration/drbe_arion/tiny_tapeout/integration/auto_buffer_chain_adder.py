
# The script takes two inputs:
# 1: transcript from modelsim
# 2: post_pnr RTL

unique_path_list = []

def get_paths_violating_holding_time():
    err_log = open("./progress_doc/log_err_for_noc")
    lines = err_log.readlines()
    readline = False
    path_list = []
    for line in lines:
        if readline:
            reg_hier = line.split(": ")[-1]
            if "ddnoc" in reg_hier and "half" in reg_hier and "wire_pipeline" in reg_hier:
                tmp_split_rst = reg_hier.split("/")
                path_list.append(("wire_binary_tree_1_8_seq_DATA_WIDTH32_NUM_OUTPUT_DATA8_NUM_INPUT_DATA1_" + tmp_split_rst[-2].split("__")[0].split("_")[-1], tmp_split_rst[-1]))
                readline = False
        if "$hold" in line:
            readline = True
    path_list.sort()
    unique_path_list.append(path_list[0])
    for i in range(len(path_list)-1):
        if path_list[i] != path_list[i+1]:
             unique_path_list.append(path_list[i+1])
    print(unique_path_list)
    err_log.close()

def add_buffer_in_post_PNR_RTL():
    for single_path in unique_path_list:

        # post_pnr_rtl = open("./post_pnr_netlists/controller_integrated_post_pnr_v5_0p44.v")
        # lines = post_pnr_rtl.readlines()
        # writeBuffer = False
        # path_list = []
        # for line in lines:
        #     if writeBuffer and single_path[1] in line:
        #         reg_hier = line.split(": ")[-1]
        #         if "ddnoc" in reg_hier and "half" in reg_hier and "wire_pipeline" in reg_hier:
        #             tmp_split_rst = reg_hier.split("/")
        #             path_list.append(("wire_binary_tree_1_8_seq_DATA_WIDTH32_NUM_OUTPUT_DATA8_NUM_INPUT_DATA1_" + tmp_split_rst[-2].split("__")[0].split("_")[-1], tmp_split_rst[-1]))
        #             writeBuffer = False
        #     if single_path[0] in line:
        #         writeBuffer = True
        # path_list.sort()
        # unique_path_list.append(path_list[0])
        # for i in range(len(path_list)-1):
        #     if path_list[i] != path_list[i+1]:
        #         unique_path_list.append(path_list[i+1])
        # print(unique_path_list)
        # post_pnr_rtl.close()

        ftest = open("test_line_insert.v")
        for i in range(10):
            ftest.write(f"{i}\n")
        ftest.close()
        ftest = open("test_line_insert.v")
        lines = ftest.readlines()
        id = 2
        ftest.write(id,"insert")
        ftest.close()


if __name__ == "__main__":
    # get_paths_violating_holding_time()
    add_buffer_in_post_PNR_RTL()
   
