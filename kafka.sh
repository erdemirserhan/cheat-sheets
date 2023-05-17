# List all topics
./bin/kafka-topics.sh --bootstrap-server <bootstrap_server>:9092 --list

# Describe a topic: Show Partition, show Replicas
./bin/kafka-topics.sh --bootstrap-server <bootstrap_server>:9092 --describe --topic <topic_name_here>

# Delete multiple topics with the same beginning
./bin/kafka-topics.sh \
    --bootstrap-server <bootstrap_server>:9092 \
    --delete \
    --topic 'your_topic_name-*.'
