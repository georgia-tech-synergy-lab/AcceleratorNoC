#include<iostream>
#include<fstream>
#include<algorithm>
#include<vector>
#include <getopt.h>

using namespace std;

int NUM_INPUT = 8;
int NUM_OUTPUT = 4;

int main(int argc, char *const argv[]){
    int opt;
    while (-1 != (opt = getopt(argc, argv, "n:N:i:I:h"))) {
        switch (opt) {
            case 'i':
            case 'I':
                NUM_INPUT = (uint64_t) std::atoi(optarg);
                break;

            case 'o':
            case 'O':
                NUM_OUTPUT = (uint64_t) std::atoi(optarg);
                break;

            default:
                std::cout << "Invalid argument to program" << std::endl;
                break;
        }
    }

    ofstream i_data_file;
    i_data_file.open("./input_file");

    for (int i=0; i< (NUM_INPUT-1); i++){
        i_data_file << i << ' ';
    }
    i_data_file << (NUM_INPUT -1); 

    i_data_file.close();

    return 0;
}
