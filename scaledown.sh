#!/bin/bash

if [ -z "${DEPLOYMENT}" -a -z "${DEPLOYMENTCONFIG}" ]; then
	echo "ERROR: Need to set DEPLOYMENT or DEPLOYMENTCONFIG environment variable!"
	exit 1
fi

if [ -z "${DEPLOYMENTCONFIG}" ]; then
    RESOURCE="deployments"
else
    RESOURCE="dc"
    DEPLOYMENT="${DEPLOYMENTCONFIG}"
fi

REPLICAS="${REPLICAS:-1}"

TOKEN="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"

# get the current number of replicas for deployment
CURRENT="$(oc --token=${TOKEN} get ${RESOURCE}/${DEPLOYMENT} -o jsonpath='{.status.availableReplicas}')"

if [ ${CURRENT} -ne ${REPLICAS} ]; then
	oc --token=${TOKEN} scale ${RESOURCE}/${DEPLOYMENT} --replicas=${REPLICAS}
else
	echo "Nothing to do, ${DEPLOYMENT} is already at ${CURRENT} replicas!"
fi

