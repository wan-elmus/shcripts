
#!/bin/bash

# Check  major parameter
if [ -z "$1" ]; then
    echo "Please provide a major as a parameter."
    exit 1
fi

major="$1"

count=0

# Read students.txt file
while IFS=' ' read -r first_name last_name student_major score1 score2 score3 score4 score5
do
    # Check if the student's major matches the specified major
    if [ "$student_major" = "$major" ]; then
    echo "$first_name $last_name"
    count=$((count + 1))
    fi
done < students.txt

# Output  students
echo "Number of students found: $count"
