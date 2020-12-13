#include <fstream>
#include <string>
#include <string.h>
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
void build_yv(yig* y);//some sort of DFS optimization per output?
void print_yig(yig *y, ofstream &outfile, int id, char type);
yig_value* copy_yv(yig_value* yv);
void clean_yig_vals(yig *y);

int main(int argc, char *argv[]){
	if (argc!=3){ //
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
							num_wires = std::atoi(str.substr(i+1,buflen-i-1).c_str())-start_wires+1; 
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
							wire_list[id].size = 1;
							wire_list[id].and_func = (OP == "&");
							parse_arg(&wire_list[id],A2,0);
							parse_arg(&wire_list[id],A3,1);
						} else if (A1[0]=='p') {
							id = std::atoi(A1.substr(2,A1.size()-1).c_str()); 
							output_list[id].size = 1;
							output_list[id].and_func = (OP == "&");
							parse_arg(&output_list[id],A2,0);
							parse_arg(&output_list[id],A3,1);
						}
					} 
					else if (success == 2){ // "assign A1 = A2;" Note A2 can be '1'bx'; //probably will never call this, but just in case
						A2 = A2.substr(0,A2.size()-1);
						int id;
						if (A1[0]=='n') {
							id = std::atoi(A1.substr(1,A1.size()-1).c_str()) - start_wires;
							wire_list[id].size = 0;
							parse_arg(&wire_list[id],A2,0);
						} else if (A1[0]=='p') {
							id = std::atoi(A1.substr(2,A1.size()-1).c_str());
							output_list[id].size = 0;
							parse_arg(&output_list[id],A2,0);
						}
					}
			}
			cnt++;	
		}

	}

	// Optimize YIGs
	for (int i = 0; i < num_outputs; i++){
		build_yv(&output_list[i]);

		//outfile << "o" << i << ":\n";
		//yig_value *temp = output_list[i].yv;
		//while (temp->yv != NULL) {
		//	outfile << "    size:" << output_list[i].size << " " << temp->inp << " and_func = " << temp->and_func << "; and_func_up = " << temp->and_func_up << "\n";
		//	if (!temp->and_func && temp->and_func_up) {
		//		output_list[i].size = output_list[i].size + 2;
		//	} else {output_list[i].size++;}
		//	temp = temp->yv;
		//}
		//outfile << "    size:" << output_list[i].size << "\n";
	}
	int new_wires = 0;
	for (int i = 0; i < num_wires; i++){
		if (wire_list[i].print && (wire_list[i].fanout > 0)) {
			new_wires++;
		} 
	}

	// Write out YIG Graph
	outfile << ".i " << num_inputs << "\n";
	outfile << ".o " << num_outputs << "\n";
	outfile << ".w " << new_wires << "\n"; 

	for (int i = 0; i < num_wires; i++) {
		if (wire_list[i].print && (wire_list[i].fanout > 0)) {
			print_yig(&wire_list[i], outfile, i+1, 'w');
		}
	}

	for (int i = 0; i < num_outputs; i++) {
		print_yig(&output_list[i], outfile, i+1, 'o');
	}
	
	outfile << ".e ";
	outfile.close();

	// Clean up
	for (int i = 0; i < num_wires; i++){
		if (wire_list[i].opt) clean_yig_vals(&wire_list[i]);
	}
	for (int i = 0; i < num_outputs; i++){
		if (output_list[i].opt) clean_yig_vals(&output_list[i]);
	}

	delete[] wire_list;
	delete[] output_list;
	return 0;	
}

//Input: yig (y) (an output) to traverse and count
//Output: None
//This function will count the number of dependencies on a wire
void count_deps(yig *y){
	if(y->type[0] == 'n'){
		build_yv(y->y[0]);
	}
	if(y->type[1] == 'n'){
		build_yv(y->y[1]);	
	}
	
}

//Input: yig (y) to be cleaned up
//Output: None
//This function will (hopefully) clean up the yig_values for the given yigs
void clean_yig_vals(yig *y) {
	if (y->size > 0){
		yig_value *temp = y->yv;
		yig_value *temp2 = temp->yv;
		while (temp2 != NULL){
			delete temp;
			temp = temp2;
			temp2 = temp->yv;
		}
	}
	else{
		delete y->yv;
	}
}

//Input: yig (y) being optimized
//Output: None
//Function should update the size of the yig and associate yig_values
//This will essentially update the pointers for the yig_values
void build_yv(yig *y) {	
	if (!(y->opt)){
		if(y->type[0] == 'n'){
			build_yv(y->y[0]);
		}
		if(y->type[1] == 'n'){
			build_yv(y->y[1]);	
		}
		if(y->type[0] == 'n' && y->pol[0]) { // && y->y[0]->and_func){ //combine at top vertex; THIS HAS BAD CORNER CASES
			yig_value* temp = y->yv; //save yv to delete
			yig_value* temp2 = y->y[0]->yv; //find end y[0]->yv list to connect in
			yig_value* temp3 = copy_yv(y->y[0]->yv);
			y->yv = temp3; //copy new list
			//for (int i = 0; i<y->y[0]->size;i++){
			while (temp2->yv != NULL) {
				temp2 = temp2->yv;
				temp3->yv = copy_yv(temp2);
				temp3 = temp3->yv;
			}
			temp3->yv = temp->yv;
			temp3->and_func_up = y->and_func;
			y->size = (!y->y[0]->and_func && y->and_func) ? y->size +  y->y[0]->size +1 : y->size +  y->y[0]->size;
			delete temp;
			y->y[0]->fanout--;
		}
		if(y->type[1] == 'n' && y->pol[1]) { // && y->y[1]->and_func){ //combine at left vertex
			yig_value* temp; //save yv to delete
			yig_value* temp3 = y->yv; //find end of y->yv list to attach to y[0]
			yig_value* temp2 = y->y[1]->yv;
			//for (int i = 0; i<y->size-1;i++){
			while (temp3->yv->yv != NULL) {
				temp3 = temp3->yv;
			}
			temp = temp3->yv;
			temp3->yv = copy_yv(temp2);
			temp3 = temp3->yv;
			//for (int i = 0; i<y->y[1]->size; i++){
			while (temp2->yv != NULL) {
				temp2 = temp2->yv;
				temp3->yv = copy_yv(temp2);
				temp3 = temp3->yv;
			}
            temp3->and_func_up = y->and_func;
			temp3 = temp3->yv;
            y->size = (!y->y[1]->and_func && y->and_func) ? y->size +  y->y[1]->size +1 : y->size +  y->y[1]->size;
			delete temp;
			y->y[1]->fanout--;
		}	
	}
	y->opt = true;
}

//Input: yv to be copied
//Output: ptr to copy of yv
//This function will make a copy of the yv as a new (dyn alloc) yv
yig_value* copy_yv(yig_value *yv){
	yig_value *ret = new yig_value;
	strcpy(ret->inp,yv->inp);
	ret->and_func = yv->and_func;
	return ret;
}

//Input: int i to be converted to string
//Output: string version of i
//Convert integer to string (base 10)
string itoa(int i){
	string ret = "";
	int r;
	while (i>0){
		r = i % 10;
		ret = (char)(48+r)+ret;
		i = (i-r)/10;
	}
	return ret;	
}

//Input: yig struct (y) being modified, input string (a), and position in yig
//Output: None
//Function will modify yig fields (pass by ptr)
void parse_arg(yig *y, string a, int input_pos){
	string s = a;
	y->print = true;
    int id;
    string id_string;

	if (s[0] == '~') { // update the yig polarity
		y->pol[input_pos] = false;
		s = s.substr(1,a.size()-1);
	} else y->pol[input_pos] = true;

	if (s[0] == 'n'){ //wire
		id = std::atoi(s.substr(1,s.size()-1).c_str()) - start_wires;
		id_string = "w" + itoa(id+1);//s.substr(1,s.size()-1); //this does the wiring nmuber fixes

		y->type[input_pos] = 'n';

		y->y[input_pos] = &wire_list[id];
		wire_list[id].fanout++;
	}
    else if (s[0] == 'p') { //input or output
		id = std::atoi(s.substr(2,s.size()-2).c_str());
		id_string = s[1] + itoa(id+1);

        y->type[input_pos] = s[1];

        if (s[1] == 'o') {
			y->type[input_pos] = 'n';
            y->y[input_pos] = &output_list[id];
        }
	}
    else { // constant
        id = std::atoi(s.substr(1,1).c_str());
		id_string = s.substr(3,s.size()-1).c_str();

        y->type[input_pos] = 'c';
	}

	y->inp[input_pos] = id;
	if (!y->pol[input_pos]) id_string.insert(0, 1, '~');
    if (input_pos == 0){
        y->yv = new yig_value;
        strcpy(y->yv->inp, id_string.c_str());
		y->yv->and_func = y->and_func;
    }
    else {
        y->yv->yv = new yig_value;
        strcpy(y->yv->yv->inp, id_string.c_str());
        y->yv->yv->and_func = y->and_func;
    }
}

//Input: yig (y) to be printed
//Output: None
//Function will print out the yig structure
void print_yig (yig *y, ofstream &outfile, int id, char type){
	yig_value *yval = y->yv;
	int cse = 0;
	int num_or = 0;
	int num_or_counter = 0;
	outfile << type << id << " = Y" << y->size << "(";
	for(int i=0; i<=y->size; i++) {
/* Next State */
		if (yval->and_func && num_or == 0) cse = 0;
		else if (num_or == 0) cse = 1;
        else if (num_or > num_or_counter) cse = 2;
        else if (num_or == num_or_counter) cse = 3;
		else if (num_or < num_or_counter) cse = 4;

		switch(cse) {
/* AND Function */
			case 0: 
			{	outfile << yval->inp;
            	for(int j=0; j<i; j++) outfile << ", 0";
            	if (yval->yv != NULL) yval = yval->yv;
				break;
			}
/* OR Function - first OR (count how many) */
			case 1: 
            {   yig_value *temp = yval->yv;
                num_or++;
                while (!temp->and_func && temp->yv != NULL && !temp->and_func_up) {
                    temp = temp->yv;
                    num_or++;
                }
				outfile << "1";
                for (int k=num_or_counter; k<i; k++) outfile << ", 0";
                num_or_counter++;
				break;
			}
/* OR Function - layers of 1's */
			case 2: 
            {   outfile << "1";
                for (int j=0; j<num_or_counter; j++) outfile << ", 1";
                for (int k=num_or_counter; k<i; k++) outfile << ", 0";
                num_or_counter++;
				break;
			}
/* OR Function - line of values */
			case 3: 
            {   outfile << yval->inp;
                yval = yval->yv;
                for (int j=0; j<num_or_counter; j++) {
                    outfile << ", " << yval->inp;
                    if (yval->yv != NULL) yval = yval->yv;
                }
                for (int k=num_or_counter; k<i; k++) outfile << ", 0";
                num_or_counter++;
				break;
			}
/* OR Function - extra line of 1's */
			case 4: 
            {	outfile << "1";
            	for (int j=0; j<num_or_counter-1; j++) outfile << ", 1";
            	for (int k=num_or_counter+1; k<=i+1; k++) outfile << ", 0";
            	num_or_counter = 0;
            	num_or = 0;
				break;
			}
		}
		if (i==y->size) outfile << ");\n";
		else outfile << ", ";
	}
}

