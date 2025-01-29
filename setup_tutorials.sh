#!/bin/sh

git clone --depth 1 --branch 0.0.0.dev4 https://github.com/RascalSoftware/python-RAT
cp -r python-RAT/RATapi/examples/normal_reflectivity/* source/examples/python/
cp -r python-RAT/RATapi/examples/domains/* source/examples/python/
cp -r python-RAT/RATapi/examples/absorption/* source/examples/python/
cp -r python-RAT/RATapi/examples/data source/examples/

rm -rf python-RAT
