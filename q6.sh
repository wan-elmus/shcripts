
#!/bin/bash

is_palindrome() {
    local input=$1
    local length=${#input}
    local i=0

    # Loop from 0 to the halfway point of the string
    while [ $i -lt $(expr $length / 2) ]; do
    if [ "${input:i:1}" != "${input:length - i - 1:1}" ]; then
        return 1 #Not palindrome
    fi
        i=$(expr $i + 1)
    done

    return 0 # palindrome
}

# Array of strings
strings=("pullup" "level" "John" "wick" "University" "racecar" "Ranger")

for string in "${strings[@]}"; do
    if is_palindrome "$string"; then
    echo "$string is a palindrome"
    else
    echo "$string is not a palindrome"
    fi
done

