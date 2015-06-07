#!/bin/bash
# Script to promote testing to dev and update l2tbinaries git repository.

# Fail on error
set -e

git checkout dev
git reset --hard 0f5dcf092ca43c3be88533b4d3fbdc1287bae948
git pull . testing
git push -f origin dev
git checkout testing
