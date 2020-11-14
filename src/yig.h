struct yig {
    int inp[3]; //indices of inp or wires
    bool pol[3]; // true if inverted
    int size; // size of top YIG; if 0, just a wire, if 1, MIG. Build larger ones recursively
    yig* y[3]; // pointers to constituent YIGs so we have access to their inputs
};


