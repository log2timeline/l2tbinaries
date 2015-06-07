#!/bin/bash
# Script to sync Windows 64-bit binary builds.

EXIT_SUCCESS=0;
EXIT_FAILURE=1;
EXIT_MISSING_ARGS=2;

SCRIPTNAME=`basename $0`;

if test $# -ne 1;
then
  echo "Usage: ./${SCRIPTNAME} PATH";
  echo "";
  echo "  PATH: path of the directory containing the Windows 64-bit MSI files.";
  echo "";

  exit ${EXIT_MISSING_ARGS};
fi

SOURCE_PATH=$1;

git checkout testing;

OLDIFS=$IFS;
IFS="
";

FILES=`ls -1 ${SOURCE_PATH}/*win-amd64*.msi`;

for FILE in ${FILES};
do
  FILE=`basename ${FILE}`;

  if test ! -f win64/${FILE};
  then
    PACKAGE_NAME=`echo ${FILE} | sed 's/-[0-9].*$//'`;
    PYTHON_VERSION=`echo ${FILE} | grep -e '-py[23][.][0-9][.]msi' | sed 's/.*\(-py[23][.][0-9]\)[.]msi/\1/'`;
    EXISTING_FILE=`ls -1 win64/${PACKAGE_NAME}-*.win-amd64${PYTHON_VERSION}.msi 2> /dev/null`;

    if ! test -z ${EXISTING_FILE};
    then
      echo "Removing old file: win64/${EXISTING_FILE}";
      git rm -f ${EXISTING_FILE}
    fi

    echo "Creating new file: win64/${FILE}";
    cp -f ${SOURCE_PATH}/${FILE} win64/;
    git add win64/${FILE};
  fi
done

IFS=$OLDIFS;

# (cd win64 && sha256sum *win-amd64*.msi >> SHA256SUMS)

