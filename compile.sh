#!/bin/bash

cmake CMakeLists.txt
make -j$(nproc)