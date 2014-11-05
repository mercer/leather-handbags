#!/bin/bash
set -e
 
# Check for nsenter. If not found, install it
boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
 
# Use bash if no command is specified
args=$@
if [[ $# = 1 ]]; then
  args+=(/bin/bash)
fi
 
boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "${args[@]}"