#include <string>
using std::string;

struct yig_value {
    int id;
    char inp[10];
    yig_value *yv;
};

struct yig {
	char inp[3][10]; //indices of inp or wires
	yig_value *yv; // Linked list of left edge values
	short id;
	bool pol[3]; // true if positive
	short size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
	bool print = false; //do not print if true
	yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
	int fanout = 0;
	bool and_func; // true if an AND 
};
