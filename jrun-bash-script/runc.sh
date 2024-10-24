#!/bin/bash

# Colors for output
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# Check if a file argument was passed
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: No source file provided.${NC}"
    echo "Usage: ./build.sh <source_file.c/cpp>"
    exit 1
fi

# Get the filename and extension
SOURCE_FILE=$1
EXT="${SOURCE_FILE##*.}"
BASENAME=$(basename "$SOURCE_FILE" .$EXT)
OUTPUT_FILE="$BASENAME.out"

# Function to compile C files
compile_c() {
    echo -e "${GREEN}Compiling C source: $SOURCE_FILE...${NC}"
    gcc "$SOURCE_FILE" -o "$OUTPUT_FILE"
}

# Function to compile C++ files
compile_cpp() {
    echo -e "${GREEN}Compiling C++ source: $SOURCE_FILE...${NC}"
    g++ "$SOURCE_FILE" -o "$OUTPUT_FILE"
}

# Detect file extension and compile accordingly
if [ "$EXT" == "c" ]; then
    compile_c
elif [ "$EXT" == "cpp" ]; then
    compile_cpp
else
    echo -e "${RED}Error: Unsupported file extension '$EXT'.${NC}"
    echo "Supported extensions: .c, .cpp"
    exit 1
fi

# Check if the compilation succeeded
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Compilation successful. Output: $OUTPUT_FILE${NC}"
    echo -e "Program running: "
    ./$OUTPUT_FILE
    echo
else
    echo -e "${RED}Compilation failed.${NC}"
    echo
fi
