# Log in to redis-cli
redis-cli AUTH <pass_here>

# Log in to the pod redis-master and delete every key that begins with abc
redis-cli -a <redis_pass_here> --scan --pattern "abc*" | xargs -L 1 redis-cli -a <redis_pass_here> DEL
