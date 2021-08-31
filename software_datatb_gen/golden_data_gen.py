import random

def input_data_memory_write(file_name, data):
    with open(file_name, "w") as fcoe:
        hex_data = ",\n".join([f"{d:016x}" for d in data])
        fcoe.write(f"memory_initialization_radix = 16;\n")
        fcoe.write(f"memory_initialization_vector = \n")
        fcoe.write(f"{hex_data};\n")

def verification_mem_write(file_name, data):
    with open(file_name, "w") as fver:
        hex_data = "\n".join([f"{d:016x}" for d in data])
        fver.write(hex_data)

if __name__ == "__main__":
    mod = 1
    data = []
    for i in range(4096):
        data.append(i)
    verification_mem_write("./data/verification.mem", data)
    input_data_memory_write("./data/input_data.coe", data)
    