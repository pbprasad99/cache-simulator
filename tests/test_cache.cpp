#include "../include/Cache.h"
#include "../include/Block.h"
#include "../include/Set.h"
#include <cassert>
#include <iostream>
#include <vector>

void test_block_basic() {
    Block b(16); // 16 bytes per block
    assert(b.valid == 0);
    assert(b.dirty == 0);
    std::vector<int> data = {1,2,3,4};
    b.writeWords(0, data);
    auto out = b.getWords(0);
    assert(out == data);
}

void test_cache_basic() {
    Cache c(64, 1, 16); // 64 bytes, direct-mapped, 16 bytes/block
    unsigned int addr = 0x10;
    std::vector<int> data = {42, 43, 44, 45};
    Block* b = c.writeBlock(addr, data);
    assert(b != nullptr);
    auto out = c.readBlock(addr);
    assert(out != nullptr);
    assert(out->getWords(addr) == data);
}

void test_set_basic() {
    Set s(64, 2, 16); // cache_size=64, 2-way, 16 bytes/block
    unsigned int addr1 = 0x0, addr2 = 0x10;
    std::vector<int> d1 = {1,2,3,4}, d2 = {5,6,7,8};
    Block* b1 = s.writeBlock(addr1, d1);
    Block* b2 = s.writeBlock(addr2, d2);
    assert(b1 != nullptr && b2 != nullptr);
    assert(s.readBlock(addr1) != nullptr);
    assert(s.readBlock(addr2) != nullptr);
}

int main() {
    test_block_basic();
    test_cache_basic();
    test_set_basic();
    std::cout << "All unit tests passed!\n";
    return 0;
}
