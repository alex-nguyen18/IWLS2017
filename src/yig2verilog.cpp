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
void print_yig(yig *y, ofstream &outfile, int id, char type);

int main(int argc, char *argv[]){
	if (argc!=3){
		cout << "Usage: ./yig2verilog <input benchmark> <output file name>" << endl;
		return 1;
	}
	string str;
	ifstream file_in(argv[1], ifstream::in);
	ofstream outfile;
	outfile.open(argv[2]);
	int cnt = 0;
	while(getline(file_in,str)){
		int buflen = str.size();
		if (str[buflen-1]!=';') {
			//cout << str[buflen-1] << endl;
			continue;
		}
		else {
			switch(cnt){
			case 0: 
			case 1: //input
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'i'){//find last entry and take index
						num_inputs = std::atoi(str.substr(i+1,buflen-i-1).c_str())+1;
						break;
					} 
				}
				break;
			case 2: //output
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'o'){ //find last entry and take index
						num_outputs = std::atoi(str.substr(i+1,buflen-i-1).c_str())+1;
						output_list = new yig [num_outputs]; //generate space for outputs
						break;
					} 
				}
				break;
			case 3: //wire
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'n'){//find last entry and take index
						num_wires = std::atoi(str.substr(i+1,buflen-i-1).c_str())-num_outputs-num_inputs; 
						wire_list = new yig [num_wires]; //generate space for the YIGs to build in
					break;
					}
				}
				break;
			default: //aigs -> yigs
				char a1[10], a2[10], op[10], a3[10];
				int success = sscanf(str.c_str(),"%*s %s %*s %s %s %s",a1, a2, op, a3);
				string A1(a1);
				string A2(a2);
				string OP(op);
				string A3(a3);
				
				if (success == 4){ // "assign A1 = A2 OP A3;"
					A3 = A3.substr(0,A3.size()-1); // remove semicolon on A3
					int id;
					if (A1[0]=='n')
						id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - num_inputs - num_outputs - 1; 
					else if (A1[0]=='p')
						id = std::atoi(A1.substr(2,A1.size()-1).c_str()) + num_inputs; 
					wire_list[id].size = 1;
					parse_arg(&wire_list[id],A2,1);
					parse_arg(&wire_list[id],A3,2);
					wire_list[id].inp[2] = -1;
					wire_list[id].pol[2] = (OP == "|"); //if or, 3rd input is 1; if and, 3rd input is 0
				} 
				else if (success == 2){ // "assign A1 = A2;" Note A2 can be '1'bx'; //probably will never call this, but just in case
					A2 = A2.substr(0,A2.size()-1);
					int id;
                    if (A1[0]=='n')
                        id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - num_inputs - num_outputs - 1;
                    else if (A1[0]=='p')
                        id = std::atoi(A1.substr(2,A1.size()-1).c_str()) + num_inputs;
					id = std::atoi(A1.substr(1,A1.size()-1).c_str()) + num_inputs; 
					wire_list[id].size = 0;
					parse_arg(&wire_list[id],A2,1);
				}
			}
			cnt++;
			//cout << cnt << endl;	
		}
		
	}

// Write out YIG Graph
	outfile << ".i " << num_inputs << "\n";
	outfile << ".o " << num_outputs << "\n";
	outfile << ".w " << num_wires << "\n"; // TODO fix num_wires once we implement optimizations
	for (int i = 0; i < num_wires; i++) {
		if (wire_list[i].print) {
			print_yig(&wire_list[i], outfile, i, 'w');
		}
	}
    for (int i = 0; i < num_outputs; i++) {
        print_yig(&output_list[i], outfile, i, 'o');
    }
    outfile << ".e ";

	outfile.close();
	delete output_list;
	delete wire_list;	
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

void print_yig(yig *y, ofstream &outfile, int id, char type) {
	switch(y->size) {
	case 0:
		outfile << type << id << " = Y0(" 
			<< y->pol[0] << y->inp[1] << ");\n";
		break;
	case 1:
		outfile << type << id << " = Y1(" 
			<< y->pol[0] << y->inp[0] << ", " 
			<< y->pol[1] << y->inp[1] << ", " 
			<< y->pol[2] << y->inp[2] << ");\n"; 
		break;
	}
	// TODO other cases...
}
