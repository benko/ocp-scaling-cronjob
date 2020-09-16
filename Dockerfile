FROM registry.redhat.io/openshift4/ose-cli:latest
COPY usage.sh /usr/local/bin/
COPY scaleup.sh /usr/local/bin/
COPY scaledown.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh
MAINTAINER gregab@p0f.net
ENV DEPLOYMENT=""
ENV DEPLOYMENTCONFIG=""
ENV REPLICAS=""
CMD usage.sh
USER 1001
