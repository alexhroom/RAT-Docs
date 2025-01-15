#!/bin/sh

git clone --depth 1 --branch 0.0.0.dev3 https://github.com/RascalSoftware/python-RAT
find python-RAT/RATapi/examples/ -type f | grep -i ipynb | xargs -i cp {} source/examples/python/
cp -r python-RAT/RATapi/examples/data source/examples/

rm -rf python-RAT
