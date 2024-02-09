# List all topics
./bin/kafka-topics.sh --bootstrap-server <bootstrap_server>:9092 --list

# Describe a topic: Show Partition, show Replicas
./bin/kafka-topics.sh --bootstrap-server <bootstrap_server>:9092 --describe --topic <topic_name_here>

# Delete multiple topics with the same beginning
./bin/kafka-topics.sh \
    --bootstrap-server <bootstrap_server>:9092 \
    --delete \
    --topic 'your_topic_name-.*'

# List all topics with SSL
./kafka-topics.sh --bootstrap-server <bootstrap_server>:9093 --list --command-config /path/to/your/client.properties

# Basic client.properties
security.protocol=SSL
ssl.keymanager.algorithm=SunX509
ssl.keystore.type=PKCS12 
ssl.keystore.location=/path/to/your/client/certificate.p12 # if in Kubernetes, first decode from base64 within echo "<text" | base64 --decode
ssl.keystore.password=<client_password>  # if in Kubernetes, first decode from base64 within echo "<text" | base64 --decode
ssl.truststore.location=/path/to/your/server/certificate/ca.crt
ssl.truststore.type=PEM
