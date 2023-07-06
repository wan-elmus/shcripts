
#!/bin/bash

# Variables to store total pay and number of employees
total_pay=0
num_employees=0

# Read each line from the employees.txt file
while IFS=" " read -r name hours wages; do
  if [[ $hours -le 40 ]]; then
    pay=$((hours * wages))
  else
    pay=$((40 * wages + 2 * (hours - 40) * wages))
  fi

  # Add the current employee's pay to the total
  total_pay=$((total_pay + pay))

  # Increment the number of employees
  ((num_employees++))

  # Output the employee's name and pay
  echo "$name: $pay"
done < employees.txt

# Compute the average pay
average_pay=$((total_pay / num_employees))

# Output the total number of employees processed and the average pay
echo "Total employees processed: $num_employees"
echo "Average pay: $average_pay"
