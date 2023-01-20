#include <cstring>
#include <iostream>
#include <string>

#include "ccalg.h"

int main(int argc, char **argv) {
    auto usage = [argv]() {
        fprintf(stderr, "Usage: %s [eqrange|obvious] input-file", argv[0]);
        exit(1);
    };
    if (argc != 3) usage();
    char* impl = argv[1];
    char* path = argv[2];
    int x;
    if (!strcmp(impl, "eqrange")) {
        x = ext_eqrange(path);
    } else if (!strcmp(impl, "obvious")) {
        x = ext_obvious(path);
    } else usage();
    std::cout << argv[1] << ": " << x << std::endl;
}
