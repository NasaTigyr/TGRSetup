#!/bin/bash
CURRENT_DIR=$(pwd)
# Set the directories
SRC_DIR="$CURRENT_DIR/src"
BIN_DIR="$CURRENT_DIR/bin"
LIB_DIR="$CURRENT_DIR/lib"

# If the script is run inside the src folder, adjust paths
if [[ $CURRENT_DIR == *"/src"* ]]; then
    SRC_DIR="$CURRENT_DIR"
    BIN_DIR="${CURRENT_DIR%/src}/bin"  # Go back one level to find the bin folder
    LIB_DIR="${CURRENT_DIR%/src}/lib"  # Go back one level to find the lib folder
fi

# Check if src directory exists, if not create it
if [ ! -d "$SRC_DIR" ]; then
    echo "Source directory ($SRC_DIR) doesn't exist. Creating..."
    mkdir "$SRC_DIR"
    echo "Please add your .java files in the $SRC_DIR directory."
    exit 0
fi

# Check if bin directory exists, if not create it
if [ ! -d "$BIN_DIR" ]; then
    echo "Bin directory ($BIN_DIR) doesn't exist. Creating..."
    mkdir "$BIN_DIR"
fi

# Check if lib directory exists, if not create it
if [ ! -d "$LIB_DIR" ]; then
    echo "Lib directory ($LIB_DIR) doesn't exist. Creating..."
    mkdir "$LIB_DIR"
    echo "If you have any external libraries, place them in the $LIB_DIR directory."
fi

# Step 1: Find the .java file containing the main method
MAIN_FILE=$(grep -rl "public[[:space:]]\+static[[:space:]]\+void[[:space:]]\+main"  "$SRC_DIR")

if [ -z "$MAIN_FILE" ]; then
    echo "No Java file with a main method found!"
    exit 1
fi

# Step 2: Extract the class name (assuming the filename matches the class name)
MAIN_CLASS=$(basename "$MAIN_FILE" .java)
#
# Compile the .java files from src to bin
#
echo "Compiling Java files..."
javac -d "$BIN_DIR" -cp "$LIB_DIR/*" $(find "$SRC_DIR" -name "*.java")

if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Compilation successful."

# Run the program
# You can specify the main class here. For example, if you have a class with the `main` method called Main:
#MAIN_CLASS="Main"

echo "Running the program..."
java -cp "$BIN_DIR:$LIB_DIR/*" $MAIN_CLASS

