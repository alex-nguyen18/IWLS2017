#include <fstream>
#include <string>
#include <iostream>
#include <stdio.h>
#include <cstdlib>
#include "yig.h"

using namespace std;

int num_inputs;
int num_outputs;
int num_wires;
yig* wire_list;
yig* output_list;

void parse_arg(yig* y,string a,int id); //update yig pass-by-ptr
//some sort of DFS optimization per output?

int main(int argc, char *argv[]){
	if (argc!=3){
		cout << "Usage: ./yig2verilog <input benchmark> <output file name>" << endl;
		return 1;
	}
	string str;
	ifstream file_in(argv[0]);
	while(getline(file_in,str)){
		int buflen = str.size();
		int cnt = 0;
		if (str[buflen-1]!=';') continue;
		else {
			switch(cnt){
			case 0: continue;
			case 1: //input
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'i'){//find last entry and take index
						num_inputs = std::atoi(str.substr(i+1,buflen-i-1).c_str())+1;
						break;
					} 
				}
			case 2: //output
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'o'){ //find last entry and take index
						num_outputs = std::atoi(str.substr(i+1,buflen-i-1).c_str())+1;
						output_list = new yig [num_outputs]; //generate space for outputs
						break;
					} 
				}
			case 3: //wire
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'n'){//find last entry and take index
						num_wires = std::atoi(str.substr(i+1,buflen-i-1).c_str())-num_outputs-num_inputs; 
						wire_list = new yig [num_wires]; //generate space for the YIGs to build in
					break;
					}
				}
			default: //aigs -> yigs
				char a1[5], a2[5], op[5], a3[5];
				int success = scanf(str.c_str(),"%*s %s %*s %s %s %s",a1, a2, op, a3);
				string A1(a1);
				string A2(a2);
				string OP(op);
				string A3(a3);
				if (success == 4){ // "assign A1 = A2 OP A3;"
					A3 = A3.substr(0,A3.size()-1); // remove semicolon on A3
					int id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - num_inputs - num_outputs - 1; 
					wire_list[id].size = 1;
					parse_arg(&wire_list[id],A2,1);
					parse_arg(&wire_list[id],A3,2);
					wire_list[id].inp[2] = -1;
					wire_list[id].pol[2] = (OP == "|"); //if or, 3rd input is 1; if and, 3rd input is 0
				} 
				else if (success == 2){ // "assign A1 = A2;" Note A2 can be '1'bx'; //probably will never call this, but just in case
					A2 = A2.substr(0,A2.size()-1);
					int id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - num_inputs - num_outputs - 1; 
					wire_list[id].size = 0;
					parse_arg(&wire_list[id],A2,1);
				}
			}
		}
		
	}
	
}

void parse_arg(yig *y, string a, int id){
    string s = a;
    if (s[0] == '~') {
        y->pol[id] = true;
        s = a.substr(1,a.size()-1);
    }
    if (s[0] == 'n'){ //wire
        y->inp[id] = atoi(s.substr(1,s.size()-1).c_str());
    }
    else{ //input
        y->inp[id] = std::atoi(s.substr(2,s.size()-1).c_str());
    }
}
