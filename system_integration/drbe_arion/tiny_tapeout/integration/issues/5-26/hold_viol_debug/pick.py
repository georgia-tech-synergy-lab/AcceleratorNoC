import sys, getopt
"""
    The script could automatically add buffers chain to 
    the paths that violate the holding time rule.
    Now support "top half" of ddnoc design. 

    The script takes two inputs:
    1: transcript from modelsim
    2: post_pnr RTL

    usage: python3 auto_buffer_chain_adder.py -i ./progress_doc/transcript_pt -r ./post_pnr_netlists/test.v

    author: Jianming TONG (jianming.tong@gatech.edu)
"""


unique_path_list = []
transcript_pt=""
post_PNR_RTL=""

def pick_linear():
    err_log = open(transcript_pt, "r")
    lines = err_log.readlines()
    picked_lines = []
    for line in lines:
        if "DUT_ddnoc_" in line:
            picked_lines.append(line)
    
    pick_log = open("picked_log_ddnoc.rpt", "w")
    pick_log.writelines(picked_lines)
    pick_log.close()
    err_log.close()

def usage():
    print("-i <path to transcript_pt>\n")     
    print("-r <path to post PNR RTL file>\n")     

if __name__ == "__main__":
    opts, args = getopt.getopt(sys.argv[1:], "hi:r:")

    for op, value in opts:
        if op == "-i":
            transcript_pt = value
        elif op == "-r":
            post_PNR_RTL = value
        elif op == "-h":
            usage()
    pick_linear()
