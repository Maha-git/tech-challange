#!/bin/bash

# This script will tell you how you're doing!

# 1 - Make sure HTTP redirects to HTTPS
LOCATION="`curl -sI http://localhost/ | grep Location`"

# 2 - HTTPS should return the secret string
SSL="`curl -sk https://localhost/ | grep power`"

if curl -sI http://localhost/ | grep "Location: https://localhost/" > /dev/null; then
    echo "OK: HTTP works and redirects to HTTPS"
    if curl -sk https://localhost/ | grep power > /dev/null; then
        echo "OK: HTTPS returns something similar to the secret string"
        curl -sk https://localhost
    else
        echo "ERROR: HTTPS doesn't include the secret string"
        exit 1
    fi
else
    echo "ERROR: HTTP doesn't redirect to HTTPS"
    exit 1
fi

echo "PASS: You fixed it."
exit 0
        



