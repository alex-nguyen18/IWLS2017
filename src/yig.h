#include <string>
using std::string;

struct yig_value {
	char inp[10];
	yig_value *yv;
};

struct yig {
	int inp[2];
	char type[2]; //'n':net ,'i':input ,'o':output ,'c':constant
	yig_value *yv; // Linked list of left edge values, will use this for prints
	bool opt = false;
	bool pol[3]; // true if positive
	int size; // size of top YIG; if 0, just a wire, if 1, MIG. Update as we combine
	bool print = false; //do not print if true
	yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
	int fanout = 0;
	bool neg = false;
	bool and_func; // true if an AND
}; 
