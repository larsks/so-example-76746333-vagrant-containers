#!/bin/sh

ssh-keygen -A
syslogd
exec "$@"
