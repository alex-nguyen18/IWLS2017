#include <fstream>
#include <string>
#include <stdio.h>

struct yig{
	int inp[3]; //indices of inp or wires
	bool pol[3]; // true if inverted
	int size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
	yig* y1, y2, y3; // pointers to constituent YIGs so we have access to their inputs
}

int num_inputs;
int num_outputs;
int num_wires;
yig* wire_list;
yig* output_list;

void parse_arg(yig* y,string a,int id); //update yig pass-by-ptr
//some sort of DFS optimization per output?

using namespace std;

int main(int argc, char *argv[]){
	if (argc!=2){
		cout << "Usage: ./yig2verilog <input benchmark> <output file name>" << endl;
		return 1;
	}
	string str;
	ifstream fine_in(argv[0];
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
						num_inputs = atoi(str.substr(i+1,buflen-i-1))+1;
						break;
					} 
				}
			case 2: //output
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'o'){ //find last entry and take index
						num_outputs = atoi(str.substr(i+1,buflen-i-1))+1;
						output_list = new yig [num_outputs]; //generate space for outputs
						break;
					} 
				}
			case 3: //wire
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'n'){//find last entry and take index
						num_wires = atoi(str.substr(i+1,buflen-i-1))-num_outputs-num_inputs; 
						wire_list = new yig [num_wires]; //generate space for the YIGs to build in
					break}
				}
			default: //aigs -> yigs
				string a1, a2, op, a3;
				int success = sscanf(str,"%*s %s %*s %s %s %s",a1, a2, op, a3);
				if (success == 4){ // "assign a1 = a2 op a3;"
					a3 = a3.substr(0,a3.size()-1); // remove semicolon on a3
					int id = atoi(a1.substr(1,a1.size()-1)) - num_inputs - num_outputs - 1; 
					wire_list[id].size = 1;
					parse_arg(&wire_list[id],a2,1);
					parse_arg(&wire_list[id],a3,2);
					wire_list[id].inp[3] = -1;
					wire_list[id].pol[3] = (op == '|'); //if or, 3rd input is 1; if and, 3rd input is 0
				} 
				else if (success == 2){ // "assign a1 = a2;" Note a2 can be '1'bx'; //probably will never call this, but just in case
					a2 = a2.substr(0,a2.size()-1);
					int id = atoi(a1.substr(1,a1.size()-1)) - num_inputs - num_outputs - 1; 
					wire_list[id].size = 0;
					parse_arg(&wire_list[id],a2,1);
				}
			}
		}
		
	}
	
}

void parse_arg(yig y, string a, int id){
	string s = a;
	if (s[0] == '~') {
		y.pol[id] = true;
		s = a.substr(1,a.size()-1);
	}
	if (s[0] == 'n'){ //wire
		y.inp[id] = atoi(s.substr(1,s.size()-1))
	}
	else{ //input
		y.inp[id] = atoi(s.substr(2,s.size()-1))
	}
}
