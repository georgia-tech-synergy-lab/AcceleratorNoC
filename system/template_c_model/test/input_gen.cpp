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

    ofstream cmd_file;
    
    vector<int> dp;
    vector<int*> cmd_list;
    cmd_list.resize(NUM_INPUT);
    dp.resize(NUM_OUTPUT);
    
    for(int i =0; i<NUM_INPUT; i++){
        dp[i] = (rand() % 10);
    }

    for(int i=0; i<NUM_INPUT; i++){
        int* target_go = new int [NUM_OUTPUT];
        for(int j=0; j<NUM_OUTPUT; j++){
            if(dp[j] == i){
                target_go[j] = 1;
            }
            else{
                target_go[j] = 0;
            }
        }
        cmd_list[i] = target_go;
    }
    
    return 0;

}
