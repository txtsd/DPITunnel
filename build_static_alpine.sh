#!/bin/ash

apk update
apk add build-base cmake openssl openssl-dev openssl-libs-static linux-headers ninja-is-really-ninja libnl3
cmake -B build -DCMAKE_BUILD_TYPE=RELEASE -DSTATIC_BINARY=true -G Ninja .
cmake --build build
