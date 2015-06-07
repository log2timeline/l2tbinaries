#!/bin/bash
# Script to promote dev to staging and update l2tbinaries git repository.

# Fail on error
set -e

git checkout staging
git reset --hard 0f5dcf092ca43c3be88533b4d3fbdc1287bae948
git pull . dev
git push -f origin staging
git checkout testing
