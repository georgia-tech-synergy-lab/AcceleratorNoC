#include<iostream>  
#include<fstream>  
#include<string>  
#include<set>

int main()  
{  
    const char* path = "./in_cmd.txt";   //要去重的文件path  
    
    std::ifstream infile;    //读旧文件（old.txt）  
    infile.open(path);  //调用open方法打开旧文件  
    
    std::string textline;   //临时变量，获取每一行内容  
    std::set<std::string> ss; //使用set，因为该容器中的内容是不可重复的  
    while(std::getline(infile, textline))  
    {  
        ss.insert(textline);  
    }  
    
    std::ofstream outfile;       //用于写new文件  
    outfile.open("./in_cmd_unique.txt");   //打开新文件。注：没有new.txt时，会自动创建名为new.txt的文件  
    for(auto& s : ss)  
    {  
        outfile<<s<<std::endl;  //输出重定向，输出ss中的每个元素  
    }  

    return 0;
}
