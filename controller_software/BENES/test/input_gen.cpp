#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
int main(){
	vector<int> dp;
    dp.resize(8);
    for(int i =0; i<8; i++){
	    dp[i] = i;
    }
	while(next_permutation(dp.begin(),dp.end())){
		for(int i=0; i<dp.size(); i++){
            std::cout << dp[i] << " ";
        }
        std::cout << std::endl;
	}
	return 0;
}