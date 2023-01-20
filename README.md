# LeetCode Problem 0327 P1

This repository is a benchmark analysis of Haskell and C++ solutions to
[LeetCode Problem 0327 P1](https://leetcode.com/problems/maximum-count-of-positive-integer-and-negative-integer/).

[This problem is discussed](https://youtu.be/U6I-Kwj-AvY)
by the `code_report` YouTube channel, where they go through
[example solutions](https://github.com/codereport/LeetCode/tree/master/Problem%20327P1)
for 24 programming languages.

## Benchmarks

Benchmarks [here](https://instinctive.github.io/edu-leetcode-0327p1/docs/bench.html).

## Notes

This problem is dominated by reading the input file.

**C++:** The video likes the `equal_range` solution for C++. I've compared it
to the most obvious C++ solution I could come up with. The results are
essentially equivalent, and I agree that the use of `equal_range` is
aesthetically pleasing.

**Haskell:** The video uses a two-pass solution for Haskell, where the input is
filtered twice. I've added a one-pass solution. The results are very different,
and in fact the Haskell one-pass solution is faster than the C++ solutions.
