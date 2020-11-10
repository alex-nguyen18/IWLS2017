#include <fstream>
#include <string>
#include <stdio.h>

struct yig{
	int inp[3]; //indices of inp or wires
	bool pol[3]; // t/f = assert/invert
	int size; // size of top YIG 
	yig* y1, y2, y3;
}

int num_inputs;
int num_outputs;
int num_wires;
yig* wire_list;

void parse_arg(yig* y,string a,int id); //update yig pass-by-ptr

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
					if(str[i] == 'i'){num_inputs = atoi(str.substr(i+1,buflen-i-1))+1; break} //find last entry and take index
				}
			case 2: //output
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'o'){num_outputs = atoi(str.substr(i+1,buflen-i-1))+1; break} //find last entry and take index
				}
			case 3: //wire
				for (int i = buflen-1; i>0; i--){
					if(str[i] == 'n'){num_wires = atoi(str.substr(i+1,buflen-i-1))-num_outputs-num_inputs; //find last entry and take index
					wire_list = new yig [num_wires]; //generate space for the YIGs to build in
					break}
				}
			default: //aigs -> yigs
				string a1, a2, a3; 
				sscanf(str,"%*s %s %*s %s %*s %s",a1, a2, a3); // "assign a1 = a2 & a3"
				int id = atoi(a1.substr(1,a1.size()-1);)
				parse_arg(&wire_list[id],string a,1);
			}
		}
		
	}
	
}


