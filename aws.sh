# First log in to AWS-Account, either using sso or these 3 Environment Variables
# Then use this to log in to EKS
aws eks update-kubeconfig --region <region_here> --name <cluster_name>

# Docker login to a ECR Instance
docker login -u <user_here> -p $(aws ecr get-login-password --region <region_here> --profile <profile_here>) <aws_host_dns>

# Helm login to a ECR Instance
helm registry login -u <user_here> -p $(aws ecr get-login-password --region <region_here> --profile <profile_here>) <aws_host_dns>
