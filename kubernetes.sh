
# Copy a file from a Kubernetes-Pod
kubectl cp <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml myfile.xml

# Copy a file from your local Machine to a Kubernetes-Pod
kubectl cp myfile.xml <namespace>/<pod_full_name>:/path/to/your/files/myfile.xml 
