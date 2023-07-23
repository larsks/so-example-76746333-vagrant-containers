#!/bin/sh

ssh-keygen -A
exec "$@"
