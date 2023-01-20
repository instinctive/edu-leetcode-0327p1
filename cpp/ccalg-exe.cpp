#include <iostream>
#include <string>

#include "ccalg.h"

int main(int argc, char **argv) {
    int x = readAndCount(argv[1]);
    std::cout << argv[1] << ": " << x << std::endl;
}
