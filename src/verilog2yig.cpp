#include <fstream>
#include <string>
#include <iostream>
#include <sstream>
#include <stdio.h>
#include <cstdlib>
#include "yig.h"

using namespace std;

int num_inputs;
int num_outputs;
int num_wires;
int start_wires;
yig* wire_list;
yig* output_list;

void parse_arg(yig* y,string a,int id); //update yig pass-by-ptr
//some sort of DFS optimization per output?
void print_yig(yig *y, ofstream &outfile, int id, char type);
int build_yv(yig *y);

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
	int w_index = 0;
    int o_index = 0;
	while(getline(file_in,str)){
		int buflen = str.size();
		if (cnt == 3) {
			istringstream iss(str);
			string temp[2];
			for (int i=0; i<2; i++) iss >> temp[i];
			if (temp[0] == "wire") start_wires = std::atoi(temp[1].substr(1,buflen-1).c_str());
		}

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
						num_wires = std::atoi(str.substr(i+1,buflen-i-1).c_str())-start_wires + 1; 
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
					if (A1[0]=='n') {
						id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - start_wires;
						wire_list[id].id = id;
                    	wire_list[id].size = 1;
                    	parse_arg(&wire_list[id],A2,0);
                    	parse_arg(&wire_list[id],A3,1);
                    	strcpy(wire_list[id].inp[2], (OP == "|") ? "1":"0"); //if or, 3rd input is 1; if and, 3rd input is 0 
						wire_list[id].and_func = (OP == "&");

						wire_list[id].yv= new yig_value;
						strcpy(wire_list[id].yv->inp, wire_list[id].inp[0]);
                    	wire_list[id].yv->yv = new yig_value;
                    	strcpy(wire_list[id].yv->yv->inp, wire_list[id].inp[1]);
					} else if (A1[0]=='p') {
						id = std::atoi(A1.substr(2,A1.size()-1).c_str()); 
						output_list[id].id = id;
						output_list[id].size = 1;
						parse_arg(&output_list[id],A2,0);
						parse_arg(&output_list[id],A3,1);
						strcpy(output_list[id].inp[2], (OP == "|") ? "1":"0"); //if or, 3rd input is 1; if and, 3rd input is 0
						output_list[id].and_func = (OP == "&");

                    	output_list[id].yv= new yig_value;
                    	strcpy(output_list[id].yv->inp, output_list[id].inp[0]);
                    	output_list[id].yv->yv = new yig_value;
                    	strcpy(output_list[id].yv->yv->inp, output_list[id].inp[1]);
					}
				} 
				else if (success == 2){ // "assign A1 = A2;" Note A2 can be '1'bx'; //probably will never call this, but just in case
					A2 = A2.substr(0,A2.size()-1);
					int id;
                    if (A1[0]=='n') {
                        id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - start_wires;
						wire_list[id].id = id;
                    	wire_list[id].size = 0;
						parse_arg(&wire_list[id],A2,0);
                        strcpy(wire_list[id].inp[1], "0");
                        strcpy(wire_list[id].inp[2], "0");

                        wire_list[id].yv= new yig_value;
                        strcpy(wire_list[id].yv->inp, wire_list[id].inp[0]);
                    } else if (A1[0]=='p') {
                        id = std::atoi(A1.substr(2,A1.size()-1).c_str());
                       	output_list[id].id = id;
						output_list[id].size = 0;
						parse_arg(&output_list[id],A2,0);
                        strcpy(output_list[id].inp[1], "0");
                        strcpy(output_list[id].inp[2], "0");

                        output_list[id].yv= new yig_value;
                        strcpy(output_list[id].yv->inp, output_list[id].inp[0]);
					}
				}
			}
			cnt++;
			//cout << cnt << endl;	
		}
		
	}

	for (int i = 0; i < num_outputs; i++) {
		int size = build_yv(&output_list[i]);
	}

// Write out YIG Graph
	outfile << ".i " << num_inputs << "\n";
	outfile << ".o " << num_outputs << "\n";
	outfile << ".w " << num_wires << "\n"; // TODO fix num_wires once we implement optimizations
	for (int i = 0; i < num_wires; i++) {
		if (wire_list[i].print && (wire_list[i].fanout > 0)) {
			print_yig(&wire_list[i], outfile, i, 'w');
		}
	}
    for (int i = 0; i < num_outputs; i++) {
        print_yig(&output_list[i], outfile, i, 'o');
    }
    outfile << ".e ";

	outfile.close();
	delete[] output_list;
	delete[] wire_list;	
}

int build_yv(yig *y) {
	if(y->pol[0] && y->and_func && (y->y[0] != NULL) && (y->y[0]->checked_by != y->id+1)) {
		int size_y0 = build_yv(y->y[0]);
		y->y[0]->fanout--;
        yig_value *head = y->y[0]->yv;
        while (head->yv != NULL) head = head->yv;
		head->yv = y->yv->yv;
		y->yv=y->y[0]->yv;
		y->size += size_y0;
		y->y[0]->checked_by = y->id+1;
	} 
	if(y->pol[1] && y->and_func && (y->y[1] != NULL) && (y->y[1]->checked_by != y->id+1)) {
        int size_y1 = build_yv(y->y[1]);
		y->y[1]->fanout--;
		yig_value *head = y->yv;
		while (head->yv->yv != NULL) head = head->yv;
        head->yv = y->y[1]->yv;
		y->size += size_y1;
        y->y[1]->checked_by = y->id+1;
    }
	return y->size;
}

void parse_arg(yig *y, string a, int input_pos){
    string s = a;
	y->print = true;
    if (s[0] == '~') {
        y->pol[input_pos] = false;
        s = a.substr(1,a.size()-1);
    } else {y->pol[input_pos] = true;}
	strcpy(y->inp[input_pos], s.c_str()); 
    if (s[0] == 'n'){ //wire
		int wire_id = std::atoi(s.substr(1,s.size()-1).c_str()) - start_wires;
		string wire_string = "w" + to_string(wire_id);
		if(!y->pol[input_pos]) wire_string = "~" + wire_string;
        strcpy(y->inp[input_pos], wire_string.c_str());
		y->y[input_pos] = &wire_list[wire_id];
		wire_list[wire_id].fanout++;
    }
    else if (s[0] == 'p') { //input
		if (y->pol[input_pos]) {strcpy(y->inp[input_pos], s.substr(1,s.size()-1).c_str());}
		else {
			string input_string = "~" + s.substr(1,s.size()-1);
			strcpy(y->inp[input_pos], input_string.c_str());
			y->y[input_pos] = 0;
		}
    }
	else { // constant
		strcpy(y->inp[input_pos], s.substr(3,s.size()-1).c_str());
	}
}
/*
void print_yig(yig *y, ofstream &outfile, int id, char type) {
	switch(y->size) {
	case 0:
		outfile << type << id << " = Y0(";
		if (y->pol[0]) outfile << '~';
		outfile << y->inp[0] << ");\n";
		break;
	case 1:
		outfile << type << id << " = Y1(";
		if (y->pol[0]) outfile << '~';
		outfile << y->inp[0] << ", " ;
		if (y->pol[1]) outfile << '~';
		outfile << y->inp[1] << ", " ;
		if (y->pol[2]) outfile << '~'; 
		outfile << y->inp[2] << "); fanout: " << y->fanout << "\n";
		break;
	}
	// TODO other cases...
}
*/
void print_yig (yig *y, ofstream &outfile, int id, char type){
	yig_value *yval = y->yv;
	outfile << type << id << " = Y" << y->size << "(";
	for(int i=0; i<=y->size; i++) {
		outfile << yval->inp;
		for(int j=0; j<i; j++) {
			if (y->and_func) outfile << ", 0";
			else outfile << ", 1";
		}
		if (i==y->size) outfile << ");\n";
		else outfile << ", ";
		yval = yval->yv;
	}
}

