#!/bin/bash

echo "Please use either scaleup.sh or scaledown.sh as container CMD!"
echo
echo "For either, you will have to also set either DEPLOYMENT or"
echo "DEPLOYMENTCONFIG environment variable to target a controller,"
echo "and optionally REPLICAS environment variable to set the"
echo "desired replica count."
echo
exit 0

