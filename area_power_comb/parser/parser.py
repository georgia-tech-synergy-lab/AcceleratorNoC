
import os

funcs = ["c_crossbar"]
test_widths = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]
for i in range(len(test_widths)):
  test_widths[i] = str(test_widths[i])

print(os.getcwd())
area_total = []
power_total = []
timing_total = []
with open("Activation_Function_report.rpt", "w") as f:
  for func in funcs:
    if func == "c_crossbar":
        test_widths = [4, 8, 16, 32, 64, 128, 256, 512]#, 1024, 2048, 4096]
    if func == 'adder_tree':
        test_widths = [4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]
    for i in range(len(test_widths)):
      root_directory = "./report/" + func + str(test_widths[i]) 

      area_path   = root_directory + "/area.rpt"
      power_path  = root_directory + "/power.rpt"


      with open(area_path,"r") as area_report:
        area_lines = area_report.readlines()

      area = area_lines[27][28:-1]
      area_total.append(area)


      with open(power_path,"r") as power_report:
        for line in power_report.readlines():
          if func in line and "tt1v25c" not in line and "c_fifo_" not in line and "Design" not in line:
            print(line)
            power = line[66:75]
            power_total.append(power)
      f.write(func + str(test_widths[i]) + "\n")
      f.write("area   = " + area   + "\n")
      f.write("power  = " + power  + "\n")

f.close()

with open("document.rpt","w") as f1:
  for i in area_total:
    f1.write(i+"\n")
  f1.write("\n")
  for i in power_total:
    f1.write(i + "\n")
  f1.write("\n")
