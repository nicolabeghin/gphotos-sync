#!/bin/bash

chmod -R a+rw /profile
rm -f /profile/Singleton*
/startup.sh "$@"