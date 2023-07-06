
#!/bin/bash

# Check if the number of parameters is correct
if [ $# -ne 1 ]; then
    echo 'Usage: ./q5.sh string or "string1 and string 2"'
    exit 1
fi

input=$1

length=${#input}

# Loop from 0 to the halfway point of the string
i=0
while [ $i -lt $(expr $length / 2) ]
do
    
    if [ "${input:i:1}" != "${input:length - i - 1:1}" ]; then
        echo "$input is not a palindrome"
        exit 0
    fi
        i=$(expr $i + 1)
done

# If loop lacks a mismatch, it's a palindrome
echo "$input is a palindrome"
