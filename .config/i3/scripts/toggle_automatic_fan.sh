#!/bin/sh

if [[ "$(nbfc status -f0 | grep Auto | cut -d: -f2)" = " True" ]]; then
	nbfc set -f0 -s 100
	nbfc set -f1 -s 100
else
	nbfc set -f0 -a
	nbfc set -f1 -a
fi
