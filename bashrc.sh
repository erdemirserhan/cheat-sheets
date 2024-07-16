function gcp() {
  branch_name=$(git symbolic-ref --short HEAD)
  commit_message="$1"
  git add .
  git commit -S -a -m "$branch_name $commit_message"
  git push origin $branch_name
}
