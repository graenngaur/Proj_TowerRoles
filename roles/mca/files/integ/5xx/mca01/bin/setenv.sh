#!/bin/sh

# export CATALINA_OPTS="$CATALINA_OPTS -server -Xms6g -Xmx6g -XX:+UseStringDeduplication -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m -XX:HeapDumpPath=/data/MCA01/logs  -Dspring.profiles.active=active.mca.infobox.bcm,tomcat,mocked-security,active.mca.document.url,target-env_integ -Djavax.net.ssl.trustStore=/opt/tomcat/conf/s598li2tcatmca01_mca.jks -Djavax.net.ssl.trustStorePassword=changeit -Dlogback.configurationFile=/data/MCA01/conf/logback.xml"
export CATALINA_OPTS="$CATALINA_OPTS -server -Xms6g -Xmx6g -XX:+UseStringDeduplication -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m -XX:HeapDumpPath=/data/MCA01/logs  -Dspring.profiles.active=tomcat,mocked-security,active.mca.document.url,target-env_integ -Djavax.net.ssl.trustStore=/opt/tomcat/conf/s598li2tcatmca01_mca.jks -Djavax.net.ssl.trustStorePassword=changeit -Dlogback.configurationFile=/data/MCA01/conf/logback.xml"

# allow encoded slash in the url
export CATALINA_OPTS="$CATALINA_OPTS -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true"

# set a specific dynatrace process group by env/union
export CATALINA_OPTS="$CATALINA_OPTS -Ddynatrace.process.group=mca-tomcat-integ-5xx"

# GC tuning
# Explicitly Set the GC Algorithm
export CATALINA_OPTS="$CATALINA_OPTS -XX:+DisableExplicitGC -XX:+UseShenandoahGC"

# remote debuggin only in INTEG 5xx MCA01
JPDA_TRANSPORT="dt_socket"
JPDA_ADDRESS="0.0.0.0:8000"
JPDA_SUSPEND="n"
