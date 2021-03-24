ARG ELK_VERSION

FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

# RUN chmod go-w /usr/share/filebeat/filebeat.yml

# Add healthcheck
HEALTHCHECK CMD filebeat test config --strict.perms=false && filebeat test output --strict.perms=false

# EXPOSE metrics port
EXPOSE 5066