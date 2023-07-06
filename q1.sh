
#!/bin/bash

total_employees=0
total_pay=0

# Read the employees.txt file
while IFS=' ' read -r name hours wages
do
    # Calculate the pay based on the provided formula
    if [ "$hours" -le 40 ]; then
    pay=$(echo "$hours * $wages" | bc)
    else
    overtime_hours=$(echo "$hours - 40" | bc)
    pay=$(echo "40 * $wages + 2 * $overtime_hours * $wages" | bc)
    fi

    # Print employee's pay
    echo "Pay for $name: $pay"

    total_employees=$((total_employees + 1))
    total_pay=$(echo "$total_pay + $pay" | bc)
done < employees.txt

# Calculate the average pay
average_pay=$(echo "scale=2; $total_pay / $total_employees" | bc)

# Print total number of employees and average pay
echo "Total employees processed: $total_employees"
echo "Average pay computed: $average_pay"

