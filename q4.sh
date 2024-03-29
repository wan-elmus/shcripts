
#!/bin/bash

# Check if no parameters are passed
if [ $# -eq 0 ]; then
    echo "Usage: ./q4.sh file.txt file.sh dir1 dir2 example.pdf ..."
    exit 1
fi

# Iterate through items
for item in "$@"
do
    # Get permissions of the item
    permissions=$(ls -l "$item" | awk '{print $1}')
    
    # Extract relevant parts of the permissions
    permission_set=$(echo "$permissions" | cut -c 2-10)
    
    first=0
    second=0
    third=0
    
    # Convert permissions into numeric values
    if [ "${permission_set:0:1}" = "r" ]; then
        first=$((first+4))
    fi
    
    if [ "${permission_set:1:1}" = "w" ]; then
        first=$((first+2))
    fi
    
    if [ "${permission_set:2:1}" = "x" ]; then
        first=$((first+1))
    fi
    
    if [ "${permission_set:3:1}" = "r" ]; then
        second=$((second+4))
    fi
    
    if [ "${permission_set:4:1}" = "w" ]; then
        second=$((second+2))
    fi
    
    if [ "${permission_set:5:1}" = "x" ]; then
        second=$((second+1))
    fi
    
    if [ "${permission_set:6:1}" = "r" ]; then
        third=$((third+4))
    fi
    
    if [ "${permission_set:7:1}" = "w" ]; then
        third=$((third+2))
    fi
    
    if [ "${permission_set:8:1}" = "x" ]; then
        third=$((third+1))
    fi
    
    # Output file name and numeric permissions
    echo "$item $first$second$third"
done
