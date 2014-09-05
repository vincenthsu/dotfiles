#!/bin/sh

PROXY_URL="http://192.168.6.2:8080"

git-proxy-connect -H $PROXY_URL $@
