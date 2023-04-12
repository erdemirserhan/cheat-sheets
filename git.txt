# Update remote branch list
git remote update origin --prune

# Create a new branch and change to it
git checkout -b <new_branch_name_here>

# Restore changed file even after staging it
git restore <file_name_here>

# Enable GPG-Signing
git config --global commit.gpgsign true
