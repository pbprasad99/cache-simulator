SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

CC = g++
CFLAGS = -Wall -pedantic -g -std=c++11 -I$(INCLUDE_DIR)
CC_C = gcc
CFLAGS_C = -Wall -pedantic -g -I$(INCLUDE_DIR)
RM = rm -rf

SRCS = $(wildcard $(SRC_DIR)/*.cpp) $(INCLUDE_DIR)/INIReader.cpp $(INCLUDE_DIR)/ini.c
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(wildcard $(SRC_DIR)/*.cpp)) $(BUILD_DIR)/INIReader.o $(BUILD_DIR)/ini.o

all: $(BUILD_DIR)/sim

$(BUILD_DIR)/sim: $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/INIReader.o: $(INCLUDE_DIR)/INIReader.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/ini.o: $(INCLUDE_DIR)/ini.c
	$(CC_C) $(CFLAGS_C) -c $< -o $@

test_cache: tests/test_cache.cpp src/Cache.cpp src/Block.cpp src/Set.cpp $(INCLUDE_DIR)/INIReader.cpp $(INCLUDE_DIR)/ini.c
	$(CC) $(CFLAGS) tests/test_cache.cpp src/Cache.cpp src/Block.cpp src/Set.cpp $(INCLUDE_DIR)/INIReader.cpp $(INCLUDE_DIR)/ini.c -o tests/test_cache
	./tests/test_cache

clean:
	$(RM) $(BUILD_DIR)
	$(RM) -r $(BUILD_DIR)/sim.dSYM
	$(RM) tests/test_cache tests/test_cache.dSYM
