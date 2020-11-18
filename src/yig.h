#include <string>
using std::string;

struct yig {
	char inp[3][10]; //indices of inp or wires
	short id;
	bool pol[3]; // true if inverted
	short size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
	bool print = false; //do not print if true
	yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
};


