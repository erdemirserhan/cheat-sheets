#!/bin/bash

# Current date in seconds since epoch
current_date=$(date +%s)

# Duration for 4 months in seconds (assuming an average of 30.44 days per month)
four_months_in_seconds=$((4 * 30 * 24 * 3600))

# List all Docker images with their creation dates in seconds since epoch
docker images --format "{{.ID}} {{.CreatedAt}}" | while read -r id created_at; do
  # Convert created_at to seconds since epoch
  created_at_seconds=$(date -d "$created_at" +%s)

  # Calculate age of the image in seconds
  image_age=$((current_date - created_at_seconds))

  # Check if the image is older than 4 months
  if [ $image_age -gt $four_months_in_seconds ]; then
    echo "Deleting image $id created at $created_at"
    docker rmi "$id"
  fi
done
