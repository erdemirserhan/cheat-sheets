#!/bin/bash

# Run the SQL script and save the output to a CSV file
psql -U <user_name> -d <database_name> -a -c "set schema '<schema_name>';" -h <db_host_here> -f count_schema_entries.sql -q -o output_file.csv

# Determine the maximum length of table_name for formatting
max_length=$(awk -F, 'NR > 1 { if (length($1) > max) max = length($1) } END { print max }' output_file.csv)
max_length=$((max_length > 11 ? max_length : 11))  # Ensure minimum length for 'table_name'

# Format the CSV output to a readable table format
{
  printf "+-%-${max_length}s-+-----------+\n" | tr ' ' '-'
  printf "| %-*s | row_count |\n" $max_length "table_name"
  printf "+-%-${max_length}s-+-----------+\n" | tr ' ' '-'
  tail -n +2 output_file.csv | while IFS=, read -r table_name row_count
  do
    printf "| %-*s | %-9s |\n" $max_length "$table_name" "$row_count"
  done
  printf "+-%-${max_length}s-+-----------+\n" | tr ' ' '-'
} > output_file.txt

# Clean up the temporary CSV file
rm output_file.csv


########## Output looks like this;
#+-------------+-----------+
#| table_name  | row_count |
#+-------------+-----------+
#| departments | 10        |
#| employees   | 50        |
#| projects    | 30        |
#+-------------+-----------+
