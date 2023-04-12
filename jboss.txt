# Restart/reload server config on jboss via cli
/opt/jboss/bin/jboss-cli.sh --connect -c ":shutdown(restart=true)"

# Restart/reload server config on jboss wildfly via cli
/opt/jboss/wildfly/bin/jboss-cli.sh --connect -c ":shutdown(restart=true)"

# Debug standalone.xml and all the other config files
cd /opt/jboss/standalone/configuration

# Debug standalone.xml and all the other config files
/opt/jboss/wildfly/standalone/configuration
