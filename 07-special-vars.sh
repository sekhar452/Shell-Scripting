#!/bin/bash

### Special variables ####

echo "All args passed to the script: $@"

echo "No of args passed to the script: $#"

echo "First Varible Passed: $1"

echo "Script Name: $0"

echo "Realpath: $(realPath $0)"

echo "Who is running this script: $USER"

