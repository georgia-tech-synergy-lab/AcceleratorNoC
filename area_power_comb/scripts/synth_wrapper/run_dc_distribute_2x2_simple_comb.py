import os

def alter(file,old_str,new_str):
  """
  替换文件中的字符串
  :param file:文件名
  :param old_str:就字符串
  :param new_str:新字符串
  :return:
  """
  file_data = ""
  with open(file, "r", encoding="utf-8") as f:
    for line in f:
      if old_str in line:
        line = new_str
  #      line = line.replace(old_str,new_str)
      file_data += line
  with open(file,"w",encoding="utf-8") as f:
    f.write(file_data)



if __name__ == "__main__":
  #### User define part
  # specify the top module name
  top_module = ["distribute_2x2_simple_comb"]
  # specify the location from the root path of "area_power"
  file_list = "../src/benes_merge_simple_seq/distribute_2x2_simple_comb.v"
  # specify the file that should not be added in the synthesis project.
  remove_list = []
  # specify the parameter list
  # parameter_value = [[4, 8, 16, 32, 64, 128, 256],[8, 16, 32, 64, 128, 256, 512]]
  parameter_value = [64]#, 1024, 2048, 4096]
  # parameter_value = [[4],[8]]
  parameter_name = ["DATA_WIDTH"]

  #### Automatic processing part
  # a) change variable.tcl
  alter("./variables.tcl", "set project ", 'set project "' + top_module[0] + '"\n')

  # b) change file_list.tcl;
  # add all verilog files in { }. 
  # list verilog files in need of removal in remove_list 
  alter("./file_list.tcl", "analyze", "analyze -format sverilog {" + file_list +  "}\n")

  # c) create report directory.
  os.system("mkdir -p ./report")

  # d) sweep params
  for i in range(len(parameter_value)):
    # 1) change the parameter
    if(len(parameter_name) > 1):
      param_list = param_list + parameter_name[i] + '=' + str(parameter_value[i]) + " "
      print('elaborate -parameter "' + param_list + '" ' + top_module[0])
      alter("./file_list.tcl","elaborate", 'elaborate -parameter "' + param_list + '" ' + top_module[0] +"\n")
    else:
      alter("./file_list.tcl","elaborate", 'elaborate -parameter "' + parameter_name[0] + "=" + str(parameter_value[i]) + '" ' + top_module[0] +"\n")
    # 2) start synthesis
    os.system("make synth")

    # 3) move report to the report directory
    os.system("mv ./SYNTH/rpt " + "./report/" + top_module[0])
