#!/bin/sh
# Fix NTP/Time
# https://github.com/boot2docker/boot2docker/issues/290
boot2docker ssh -- sudo killall -9 ntpd
boot2docker ssh -- sudo ntpclient -s -h pool.ntp.org
boot2docker ssh -- sudo ntpd -p pool.ntp.org