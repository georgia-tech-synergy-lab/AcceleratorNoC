import os


def read_area(f):
    lines = f.readlines()
    for line in lines:
        if "Total cell area:" in line:
            return str(float(line.split(":")[1])) + "\n"

def read_power(f):
    lines = f.readlines()
    for line in lines:
        if "mW" in line and "Total   " in line:
            print(line)
            return str(float(line.split(" ")[-2])) + "\n"

if __name__ == "__main__":

    # read name of all topologies 
    topologies = os.listdir(os.getcwd())
    del_id_list = []
    for i in range(len(topologies)):
        if "read_results.py" in topologies[i]:
            del_id_list.append(i)
        if "flattened_benes_lvt" in topologies[i]:
            del_id_list.append(i)
        if "area_rpt" in topologies[i]:
            del_id_list.append(i)
        if "power_rpt" in topologies[i]:
            del_id_list.append(i)

    del_id_list = sorted(del_id_list, key = lambda x: x) 
    for i in range(len(del_id_list)-1,-1,-1):
        del topologies[del_id_list[i]] 

    module_lut = {"benes": "benes_simple_seq", "flattened_benes": "flatten_benes_simple_seq", "flattened_benes_lvt": "flatten_benes_simple_seq"}

    area_rpt = open("area_rpt","w")
    power_rpt = open("power_rpt","w")

    #
    for topo in topologies: 
        module = module_lut[topo]
        config_list = os.listdir(os.getcwd()+"/"+ topo)
        config_list = sorted(config_list, key = lambda x: (int(x.split("_")[0])))
        for config in config_list:
            tmp_area_file = open(os.getcwd()+"/"+ topo + "/" + config + "/" + "reports" +"/" + module + "_area.rpt" )
            area_rpt.write(read_area(tmp_area_file))
            tmp_area_file.close()

            tmp_power_file = open(os.getcwd()+"/"+ topo + "/" + config + "/" + "reports" +"/" + module + "_power.rpt" )
            power_rpt.write(read_power(tmp_power_file))
            tmp_power_file.close()

    area_rpt.close()
    power_rpt.close()
