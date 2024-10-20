# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -g -Iinclude

# Target binaries
TARGETS = server client

# Source files
SRCS_SERVER = src/server.c src/handler.c src/server.c
SRCS_CLIENT = src/client.c

# Object files
OBJS_SERVER = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)

# Output directories
BIN_DIR = bin
BUILD_DIR = build

# Build targets
all: $(BIN_DIR)/server $(BIN_DIR)/client

$(BIN_DIR)/server: $(OBJS_SERVER)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/server $(OBJS_SERVER)

$(BIN_DIR)/client: $(OBJS_CLIENT)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/client $(OBJS_CLIENT)

# Compile source files into object files
$(BUILD_DIR)/%.o: src/%.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)
