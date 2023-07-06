
#!/bin/bash

pass_count=0
fail_count=0

# Read the students.txt file 
while IFS=' ' read -r first_name last_name major score1 score2 score3 score4 score5
do
    # Compute average test score
    total_score=$((score1 + score2 + score3 + score4 + score5 + score5))
    average_score=$(echo "scale=2; $total_score / 6" | bc)

    # Assign a letter grade based on the average score
    if [ $(echo "$average_score >= 90" | bc -l) -eq 1 ]; then
        grade="A"
    elif [ $(echo "$average_score >= 80" | bc -l) -eq 1 ]; then
        grade="B"
    elif [ $(echo "$average_score >= 70" | bc -l) -eq 1 ]; then
        grade="C"
    elif [ $(echo "$average_score >= 59" | bc -l) -eq 1 ]; then
        grade="D"
    else
        grade="F"
    fi

    # Print student's last name, major, and letter grade
    echo "Last Name: $last_name"
    echo "Major: $major"
    echo "Grade: $grade"
    echo

    # Update the pass/fail count
    if [ "$grade" != "F" ]; then
        pass_count=$((pass_count + 1))
    else
        fail_count=$((fail_count + 1))
    fi

done < "students.txt"

# Output 
echo "Number of students passed: $pass_count"
echo "Number of students failed: $fail_count"
