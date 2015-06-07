#!/bin/bash
# Script to reorder and squash commits

# Remove lines of comment
sed '/^#/ d' -i $1;
# Remove empty lines
sed '/^$/ d' -i $1;

# Group the commits in the following order:
#   Updated README.md
#   Worked on utility scripts.
#   Worked on tests.
#   Updated macOS builds of dependencies.
#   Updated 32-bit Windows builds of dependencies.
#   Updated 64-bit Windows builds of dependencies.

TMPFILE="/tmp/$$";

grep "Updated README.md" $1 > ${TMPFILE};
grep "Worked on utility scripts" $1 >> ${TMPFILE};
grep "Worked on tests" $1 >> ${TMPFILE};
grep "Updated macOS builds of dependencies" $1 >> ${TMPFILE};
grep "Updated 32-bit Windows builds of dependencies" $1 >> ${TMPFILE};
grep "Updated 64-bit Windows builds of dependencies" $1 >> ${TMPFILE};

cat ${TMPFILE} > $1;

rm -f ${TMPFILE};

