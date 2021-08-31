import numpy as np
import math

NUM_IN = 8 # number of input data
NUM_STG = int(2*math.log2(NUM_IN))-1 # number of stages
NUM_TEST_CASE = 4096

def benes_construct(num_stg, num_in):
    """
        benes_connection is the connection function between stages,
        so its dim is (NUM_STG-1)*NUM_IN
        
        e.g. NUM_IN = 8 -> benes_connection is 4*8

              benes_con[0]  benes_con[1]  benes_con[2]  benes_con[3]
        -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|
        -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|
            0     X       4      X     8      X     12       X    16 
        -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|
        -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|
            1    X  X     5            9            13    X  X    17 
        -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|
        -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|
            2     X       6      X     10     X     14       X    18 
        -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|
        -->|___|-------->|___|------->|___|------->|___|-------->|___|
            3             7            11           15            19  
        
        benes_connection = [
            [0, 4, 1, 5, 2, 6, 3, 7],
            [0, 2, 1, 3, 4, 6, 5, 7],
            [0, 2, 1, 3, 4, 6, 5, 7],
            [0, 4, 1, 5, 2, 6, 3, 7]
        ]
    """
    benes_connection = np.zeros([num_stg-1, num_in], np.int16)
    num_half_stg = int(math.log2(num_in))

    for stg_id in range(0, num_half_stg-1):
        num_data_per_group = ((1<<num_half_stg) >> stg_id)
        data_mask = num_data_per_group - 1
        num_group = 1 << stg_id
        for group_idx in range(num_group):
            for data_idx in range(num_data_per_group):
                # print(stg_id)
                # print(data_idx + group_idx*num_data_per_group)
                benes_connection[stg_id][data_idx + group_idx*num_data_per_group] = ((data_idx >> 1) & data_mask)
                if ((data_idx & 1) == 1):
                    benes_connection[stg_id][data_idx + group_idx*num_data_per_group] += (num_data_per_group >> 1)
                benes_connection[stg_id][data_idx + group_idx*num_data_per_group] += num_data_per_group*group_idx
        
    for stg_id in range(num_half_stg-1, num_stg-1):
        num_data_per_group = ((1 << num_half_stg) >> (num_stg - 2 - stg_id))
        data_mask = num_data_per_group - 1
        num_group = num_stg - 1 - stg_id
        for group_idx in range(num_group):
            for data_idx in range(num_data_per_group):
                benes_connection[stg_id][data_idx + group_idx*num_data_per_group] = ((data_idx >> 1) & data_mask)
                if ((data_idx & 1) == 1):
                    benes_connection[stg_id][data_idx + group_idx*num_data_per_group] += (num_data_per_group >> 1)
                benes_connection[stg_id][data_idx + group_idx*num_data_per_group] += num_data_per_group*group_idx
    
    return benes_connection

def benes(data_in, ctrl, num_in, num_stg):
    """
        ctrl: 2 bits for each switch;
            layout: MSB [last_stage_bottom_switch, ..., last_stage_top_switch, ..., first_stage_bottom_switch, ..., first_stage_top_switch] LSB
            each item has 2 bits:
                11 --> Multicast_HighIn
                00 --> Multicast_LowIn
                10 --> Pass Through
                01 --> Pass Switch
        in: NUM_IN * DATA_WIDTH uint data

        -->|¯¯¯|--------data[0][0]->|¯¯¯|------data[1][0]->|¯¯¯|------data[2][0]->|¯¯¯|--------data[3][0]->|¯¯¯|->data[4][0]
        -->|___|-\ /----data[0][1]->|___|--\ /-data[1][1]->|___|--\ /-data[2][1]->|___|----\ /-data[3][1]->|___|->data[4][1]
            0     X                  4      X               8      X               12       X               16              
        -->|¯¯¯|-/ \/---data[0][2]->|¯¯¯|--/ \-data[1][2]->|¯¯¯|--/ \-data[2][2]->|¯¯¯|---\/ \-data[3][2]->|¯¯¯|->data[4][2]
        -->|___|-\ /\ /-data[0][3]->|___|------data[1][3]->|___|------data[2][3]->|___|-\ /\ /-data[3][3]->|___|->data[4][3]
            1     X  X               5                      9                      13    X  X               17              
        -->|¯¯¯|-/ \/ \-data[0][4]->|¯¯¯|------data[1][4]->|¯¯¯|------data[2][4]->|¯¯¯|-/ \/ \-data[3][4]->|¯¯¯|->data[4][4]
        -->|___|-\ /\---data[0][5]->|___|--\ /-data[1][5]->|___|--\ /-data[2][5]->|___|---/\ /-data[3][5]->|___|->data[4][5]
            2     X                  6      X               10     X               14       X               18              
        -->|¯¯¯|-/ \----data[0][6]->|¯¯¯|--/ \-data[1][6]->|¯¯¯|--/ \-data[2][6]->|¯¯¯|----/ \-data[3][6]->|¯¯¯|->data[4][6]
        -->|___|--------data[0][7]->|___|------data[1][7]->|___|------data[2][7]->|___|--------data[3][7]->|___|->data[4][7]
            3                        7                      11                     15                       19              
    """
    benes_connection = benes_construct(num_stg, num_in)
    data = np.zeros([num_stg, num_in], np.int64)
    # first level transmission
    for i in range((num_in>>1)):
        if ctrl[0][i] == 0:
            data[0][(i<<1)] = data_in[(i<<1)]
            data[0][(i<<1)+1] = data_in[(i<<1)]
        elif ctrl[0][(i<<1)] == 1:
            data[0][(i<<1)] = data_in[(i<<1)+1]
            data[0][(i<<1)+1] = data_in[(i<<1)]
        elif ctrl[0][(i<<1)] == 2:
            data[0][(i<<1)] = data_in[(i<<1)]
            data[0][(i<<1)+1] = data_in[(i<<1)+1]
        elif ctrl[0][(i<<1)] == 3:
            data[0][(i<<1)] = data_in[(i<<1)+1]
            data[0][(i<<1)+1] = data_in[(i<<1)+1]
        else:
            data[0][(i<<1)] = data_in[(i<<1)]
            data[0][(i<<1)+1] = data_in[(i<<1)+1]
    

    # following four level
    for stg_idx in range(num_stg-1):
        # connection function transmission
        for data_idx in range(num_in):
            data[stg_idx + 1][benes_connection[stg_idx][data_idx]] = data[stg_idx][data_idx]

        # switch transmission
        for i in range((num_in>>1)):
            if ctrl[stg_idx+1][i] == 0:
                data[stg_idx+1][(i<<1)] = data[stg_idx][(i<<1)]
                data[stg_idx+1][(i<<1)+1] = data[stg_idx][(i<<1)]
            elif ctrl[0][i] == 1:
                data[stg_idx+1][(i<<1)] = data[stg_idx][(i<<1)+1]
                data[stg_idx+1][(i<<1)+1] = data[stg_idx][(i<<1)]
            elif ctrl[0][i] == 2:
                data[stg_idx+1][(i<<1)] = data[stg_idx][(i<<1)]
                data[stg_idx+1][(i<<1)+1] = data[stg_idx][(i<<1)+1]
            elif ctrl[0][i] == 3:
                data[stg_idx+1][(i<<1)] = data[stg_idx][(i<<1)+1]
                data[stg_idx+1][(i<<1)+1] = data[stg_idx][(i<<1)+1]
            else:
                data[stg_idx+1][(i<<1)] = data[stg_idx][(i<<1)]
                data[stg_idx+1][(i<<1)+1] = data[stg_idx][(i<<1)+1]

    # for stg_idx in range(num_stg):
    #     print("".join([f"{tmp} " for tmp in data[stg_idx][:]]))
    return data[num_stg-1][:]


if __name__ == "__main__":
    file_list = []
    for i in range(NUM_IN):
        file_list.append(open(f"./data/random_gen_input{i}.mem", "r").readlines())
    
    cmd_file = open(f"./data/random_cmd_input.mem", "r").readlines()

    ctrl = np.zeros([NUM_STG, NUM_IN])
    data = np.zeros(NUM_IN, np.int64)
    
    res_file = open(f"./data/res_verification.mem", "w")

    for i in range(NUM_TEST_CASE):
        for j in range(NUM_IN):
            data[j] = int(file_list[j][i][:-1], 16) 
        cmd_single = cmd_file[i][:-1]
        for k in range(NUM_STG):
            for j in range((NUM_IN>>1)):
                end_idx = (-1) * 2 * (k*(NUM_IN>>1)+j)
                if end_idx == 0:
                    ctrl[k][j] = int(cmd_single[-2:], 2)
                else:
                    ctrl[k][j] = int(cmd_single[(end_idx-2):end_idx], 2)

        o_data = benes(data, ctrl, NUM_IN, NUM_STG)
        res_output = "".join([f"{single_data:08x}" for single_data in o_data])
        res_file.write(res_output+"\n")
