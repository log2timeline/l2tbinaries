#!/bin/bash
# Script to promote staging to stable and update l2tbinaries git repository.

# Fail on error
set -e

git checkout main
git reset --hard 0f5dcf092ca43c3be88533b4d3fbdc1287bae948
git pull . staging
git push -f origin main
git checkout testing
