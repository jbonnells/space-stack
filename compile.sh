#!/bin/bash

mkdir build
cd build
cmake .. -DCMAKE_CXX_STANDARD=23
make -j$(nproc)