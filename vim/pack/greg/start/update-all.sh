#!/bin/bash

set -e

cd `dirname $0`
git submodule update --remote --merge --recursive --force
