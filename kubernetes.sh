
# Copy a file from a Kubernetes-Pod
kubectl cp <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml myfile.xml

# Copy a file from your local Machine to a Kubernetes-Pod
kubectl cp myfile.xml <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml
# Delete every deployment with a name containt <word>
kubectl get deployments -n=<your_namespace> | grep '<word>' | awk '{print $1}' | xargs kubectl delete deployment -n=<your_namespace>
# Fire up a Pod to debug stuff
kubectl run -i --tty --rm debug --image=ubuntu --restart=Never -- bash

# Create an NGINX Pod
kubectl run nginx --image=nginx

# Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)
kubectl run nginx --image=nginx --dry-run=client -o yaml

#Create a deployment
kubectl create deployment --image=nginx nginx

#Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml

#Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run) and save it to a file.
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml
