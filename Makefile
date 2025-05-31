SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

CC = g++
CFLAGS = -Wall -pedantic -g -I$(INCLUDE_DIR)
RM = rm -rf

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

all: $(BUILD_DIR)/sim

$(BUILD_DIR)/sim: $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(BUILD_DIR)
	$(RM) -r $(BUILD_DIR)/sim.dSYM
