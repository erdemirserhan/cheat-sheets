# Restart/reload server config on jboss via cli
/opt/jboss/bin/jboss-cli.sh --connect -c ":shutdown(restart=true)"

# Restart/reload server config on jboss wildfly via cli
/opt/jboss/wildfly/bin/jboss-cli.sh --connect -c ":shutdown(restart=true)"

# Restart/reload server config on jboss via cli with tls (9993 is tls for management url)
/opt/jboss/bin/jboss-cli.sh --connect --controller=remote+https://localhost:9993 -c ":shutdown(restart=true)"

# Debug standalone.xml and all the other config files #
cd /opt/jboss/standalone/configuration

# Debug standalone.xml and all the other config files
cd /opt/jboss/wildfly/standalone/configuration

# Wait until you make a connection to the jboss servers via 9993 https
(/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 &) &&\
        while true; do sleep 2 ; curl -sk http://127.0.0.1:9993 > /dev/null ; \
       [ $? -eq 0 ] && break; done &&\
