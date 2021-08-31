import random
import math

NUM_IN = 8
NUM_TEST_CASE = 4096
DATA_WIDTH = 32
COMMAND_WIDTH = 2

# software functionality 
def input_data_memory_write(file_name, data):
    with open(file_name, "w") as fcoe:
        hex_data = ",\n".join([f"{d:016x}" for d in data])
        fcoe.write("memory_initialization_radix = 16;\n")
        fcoe.write("memory_initialization_vector = \n")
        fcoe.write(f"{hex_data};\n")


def random_cmd_write_mem(file_name, data):
    cmd_out = []

    for i in range(len(data)):
        cmd_single_flatten = ""
        for j in range(len(data[0])):
            cmd_single_flatten += f"{data[i][j]:02b}"
        cmd_out.append(cmd_single_flatten)

    binary_data = "\n".join([d for d in cmd_out])

    with open(file_name, "w") as frand:
        frand.write("memory_initialization_radix = 2;\n")
        frand.write("memory_initialization_vector = \n")
        frand.write(f"{binary_data};\n")


def random_cmd_write(file_name, data):
    cmd_out = []

    for i in range(len(data)):
        cmd_single_flatten = ""
        for j in range(len(data[0])):
            cmd_single_flatten += f"{data[i][j]:02b}"
        cmd_out.append(cmd_single_flatten)

    with open(file_name, "w") as fver:
        binary_data = "\n".join([d for d in cmd_out])
        fver.write(binary_data)


def random_data_write_mem(file_name, data):
    data_hex = ",\n".join([f"{d:016x}" for d in data])

    with open(file_name, "w") as frand:
        frand.write("memory_initialization_radix = 16;\n")
        frand.write("memory_initialization_vector = \n")
        frand.write(f"{data_hex};\n")


def random_data_write(file_name, data):
    data_hex = "\n".join([f"{d:016x}" for d in data])
    
    with open(file_name, "w") as frand:
        frand.write(f"{data_hex}\n")


# random data generation
def random_data_gen(num_case, data_width):
    data = []
    for n in range(num_case):
        data.append(random.randint(0, ((1<<data_width)-1)))
    return data


# random control generation
def random_cmd_gen(num_case, command_width, num_in):
    """
        layout: MSB [last_stage_bottom_switch, ..., last_stage_top_switch, ..., first_stage_bottom_switch, ..., first_stage_top_switch] LSB    """
    command = []
    for n in range(num_case):
        cmd = []
        for i in range(int((num_in>>1)*(2*math.log2(num_in)-1))):
            cmd.append(random.randint(0, ((1<<command_width)-1)))
        command.append(cmd)
        
    return command


if __name__ == "__main__":
    for i in range(NUM_IN):
        data = random_data_gen(NUM_TEST_CASE, DATA_WIDTH)
        random_data_write(f"./data/random_gen_input{i}.mem", data)
        random_data_write_mem(f"./data/random_gen_input{i}.coe", data)

    cmd = random_cmd_gen(NUM_TEST_CASE, COMMAND_WIDTH, NUM_IN)
    random_cmd_write(f"./data/random_cmd_input.mem", cmd)
    random_cmd_write_mem(f"./data/random_cmd_input.coe", cmd)
