#!/bin/bash

eval "$(fixuid -q)" && sudo /startup.sh "$@"