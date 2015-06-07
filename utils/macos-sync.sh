#!/bin/bash
# Script to sync macOS binary builds.

EXIT_SUCCESS=0;
EXIT_FAILURE=1;
EXIT_MISSING_ARGS=2;

SCRIPTNAME=`basename $0`;

if test $# -ne 1;
then
  echo "Usage: ./${SCRIPTNAME} PATH";
  echo "";
  echo "  PATH: path of the directory containing the macOS DMG files.";
  echo "";

  exit ${EXIT_MISSING_ARGS};
fi

SOURCE_PATH=$1;

git checkout testing;

OLDIFS=$IFS;
IFS="
";

FILES=`ls -1 ${SOURCE_PATH}/*.dmg`;

for FILE in ${FILES};
do
  FILE=`basename ${FILE}`;

  if test ! -f macos/${FILE};
  then
    BASENAME=`echo ${FILE} | sed 's/-[0-9].*$//'`;
    EXISTING_FILE=`ls -1 macos/${BASENAME}-* 2> /dev/null`;

    if ! test -z "${EXISTING_FILE}";
    then
      echo "Removing old file: macos/${EXISTING_FILE}";
      git rm -f ${EXISTING_FILE}
    fi

    echo "Creating new file: macos/${FILE}";
    cp -f ${SOURCE_PATH}/${FILE} macos/;
    git add macos/${FILE};
  fi
done

IFS=$OLDIFS;

# (cd macos && sha256sum *.dmg >> SHA256SUMS)

