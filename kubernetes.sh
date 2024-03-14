
# Copy a file from a Kubernetes-Pod
kubectl cp <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml myfile.xml

# Copy a file from your local Machine to a Kubernetes-Pod
kubectl cp myfile.xml <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml 
# Delete every deployment with a name containt <word>
kubectl get deployments -n=<your_namespace> | grep '<word>' | awk '{print $1}' | xargs kubectl delete deployment -n=<your_namespace>
