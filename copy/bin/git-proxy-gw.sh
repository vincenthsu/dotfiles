#!/bin/sh

PROXY_URL="http://<ip>:<port>"

git-proxy-connect -H $PROXY_URL $@
