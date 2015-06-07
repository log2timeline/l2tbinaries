#!/bin/bash
# Script to generate the SHA256SUM files.

git checkout testing

(cd win32 && chmod a-x *.msi && sha256sum *.msi > SHA256SUMS);
git commit -a -m "Updated 32-bit Windows builds of dependencies." 2>/dev/null;

(cd win64 && chmod a-x *.msi && sha256sum *.msi > SHA256SUMS);
git commit -a -m "Updated 64-bit Windows builds of dependencies." 2> /dev/null;

GIT_SEQUENCE_EDITOR="./utils/git-sequence-editor.sh" git rebase -i 0f5dcf092ca43c3be88533b4d3fbdc1287bae948

