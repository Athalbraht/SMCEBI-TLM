SHELL := /bin/bash

CC := gcc

PROGRAM_NAME := myprogram

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

CFLAGS := -Wall -Wpedantic -Wextra 
CPPFLAGS := -Iinclude

SRC := $(wildcard $(SRC_DIR)/*.cpp)
# Podmienia nazwy src/x.cpp na obj/x.o
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC))

all: $(OBJECTS) | $(BIN_DIR)
	
	$(CC) $(CFLAGS) $^ -o $(BIN_DIR)/$(PROGRAM_NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR) # | oznacza warunek wstępny nie wchodzący w regułę
	# Stworz plik obiektowy
	$(CC) -c $^ $(CFLAGS) $(CPPFLAGS) -o $@

$(BIN_DIR) $(OBJ_DIR):
	# stworz folder bin lub obj
	@mkdir -p $@

clean:
	@rm -rf $(BIN_DIR)
	@rm -rf $(OBJ_DIR)

