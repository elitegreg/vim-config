#!/bin/bash

set -e

cd `dirname $0`
git submodule update --init --remote --merge --recursive --force
