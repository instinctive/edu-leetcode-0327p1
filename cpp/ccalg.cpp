#include <algorithm>
#include <fstream>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>

#include "ccalg.h"

int maximumCount(std::vector<int>& nums) {
    auto [a, b] = std::equal_range(nums.begin(), nums.end(), 0);
    return std::max(
        std::distance(nums.begin(), a), 
        std::distance(b, nums.end()));
}

extern "C" {
int readAndCount(const char* cpath) {
    std::string path(cpath);
    std::ifstream is(path);
    std::istream_iterator<int> start(is), end;
    std::vector<int> nums(start, end);
    return maximumCount(nums);
}
}
