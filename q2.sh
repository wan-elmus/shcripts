
#!/bin/bash

# Check if the major parameter is provided
if [ -z "$1" ]; then
    echo "Please provide a major as a parameter."
    exit 1
fi

major="$1"

# Variable to keep track of the number of students found
count=0

# Read the students.txt file line by line
while IFS=' ' read -r first_name last_name student_major score1 score2 score3 score4 score5
do
    # Check if the student's major matches the specified major
    if [ "$student_major" = "$major" ]; then
    echo "$first_name $last_name"
    count=$((count + 1))
    fi
done < students.txt

# Output the number of students found
echo "Number of students found: $count"
