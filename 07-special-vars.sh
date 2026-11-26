#!/bin/bash

### Special variables ####

echo "All args passed to the script: $@"

echo "No of args passed to the script: $#"

echo "First Varible Passed: $1"

echo "Script Name: $0"

echo "Real_Path: $(realPath $0)"

echo "Who is running this script: $user"

