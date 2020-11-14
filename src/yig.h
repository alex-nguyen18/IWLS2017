struct yig {
	short inp[3]; //indices of inp or wires
	bool pol[3]; // true if inverted
	short size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
	bool print_n = false; //do not print if true
	yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
};


