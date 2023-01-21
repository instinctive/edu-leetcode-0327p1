#include <algorithm>
#include <fstream>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>

#include "ccalg.h"

typedef int func(std::vector<int>& nums);

// Actual Algorithms
// ----------------------------------------------------------------------

int eqrange(std::vector<int>& nums) {
    auto [a, b] = std::equal_range(nums.begin(), nums.end(), 0);
    return std::max(
        std::distance(nums.begin(), a), 
        std::distance(b, nums.end()));
}

int obvious(std::vector<int>& nums) {
    const int size = nums.size();
    int negs = 0;
    int zero = 0;
    int i = 0;
    for(; i<size && nums[i] < 0;  ++i, ++negs);
    for(; i<size && nums[i] == 0; ++i, ++zero);
    return std::max(negs, size - negs - zero);
}

// File Handling
// ----------------------------------------------------------------------

int doFile(func *f, const char* cpath) {
    std::string path(cpath);
    std::ifstream is(path);
    std::istream_iterator<int> start(is), end;
    std::vector<int> nums(start, end);
    return (*f)(nums);
}

extern "C" {
int ext_eqrange(const char* cpath) {
    return doFile(eqrange, cpath);
}
int ext_obvious(const char* cpath) {
    return doFile(obvious, cpath);
}
}
