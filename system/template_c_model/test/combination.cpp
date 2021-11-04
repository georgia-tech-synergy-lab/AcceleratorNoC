// #include "stdafx.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <getopt.h>
 
using namespace std;
 
int NUM_INPUT = 8;
int NUM_OUTPUT = 4;
 
bool compare(int a, int b){
    if(a > b){
        return true;
    }else{
        return false;
    }
}

void combination(int t[], int c, int total){
    //initial first combination like:1,1,0,0,0
    vector<int> vecInt(total,0);
    ofstream output_data("./in_cmd.txt");

    for(int i = 0; i < c; ++i){
        vecInt[i] = 1;
    }
    
    for(int i = 0; i < vecInt.size(); ++i){
        if(vecInt[i] == 1){
            output_data << t[i] << " ";
        }
    }
    output_data << endl;
 
    for(int i = 0; i < total - 1; ++i){
        if(vecInt[i] == 1 && vecInt[i+1] == 0){
            //1. first exchange 1 and 0 to 0 1
            swap(vecInt[i], vecInt[i+1]);
 
            //2.move all 1 before vecInt[i] to left
            sort(vecInt.begin(),vecInt.begin() + i, compare);
 
            //after step 1 and 2, a new combination is exist
            for(int i = 0; i < vecInt.size(); ++i){
                if(vecInt[i] == 1){
                    output_data << t[i] << " ";
                }
            }
            output_data << endl;
 
            //try do step 1 and 2 from front
            i = -1;
        }
    }

    output_data.close();
}

int main(int argc, char *const argv[])
{
    int opt;
    while (-1 != (opt = getopt(argc, argv, "i:I:o:O:h"))) {
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

    int t[int(NUM_INPUT*NUM_OUTPUT)];
    for(int i=0; i<NUM_INPUT; i++){
        for (int j=0; j<NUM_OUTPUT; j++){
            t[int(i*NUM_OUTPUT) + j] = i;
        }
    } 

    combination(t, NUM_OUTPUT, NUM_INPUT*NUM_OUTPUT);
    return 0;
}
