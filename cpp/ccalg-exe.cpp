#include <iostream>
#include <string>

#include "ccalg.h"

int main() {
    const char* path = "nums.txt";
    int x = readAndCount(path);
    std::cout << x << std::endl;
}
