#include <string>
using std::string;

struct yig_value {
    int id;
    char inp[10];
    char *yig_value;
};

struct yig {
	char inp[3][10]; //indices of inp or wires
	yig_value *yv; // Linked list of left edge values
	short id;
	bool pol[3]; // true if inverted
	short size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
	bool print = false; //do not print if true
	yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
	bool fanout = false;
};
