#!/bin/bash
set -e

webfsd -p 8080 -r /tmp/monitoring-endpoints -u nobody -g nogroup
