#!/bin/bash
#
# Script to set up Travis-CI test VM.

PYTHON2_DEPENDENCIES="python-plaso";

PYTHON3_DEPENDENCIES="python3-plaso";

# Exit on error.
set -e;

if test ${TRAVIS_OS_NAME} = "osx";
then
	for PACKAGE in macos/*.dmg;
	do
		PACKAGE=`echo ${PACKAGE} | sed 's?macos/\(.*\)-[0-9].*.dmg?\1?'`;

		echo "Installing: ${PACKAGE}";
		sudo /usr/bin/hdiutil attach macos/${PACKAGE}-*.dmg;
		sudo /usr/sbin/installer -target / -pkg /Volumes/${PACKAGE}-*.pkg/${PACKAGE}-*.pkg;
		sudo /usr/bin/hdiutil detach /Volumes/${PACKAGE}-*.pkg
	done

elif test ${TRAVIS_OS_NAME} = "linux";
then
	TRACK=${TRAVIS_BRANCH/master/stable};

	sudo add-apt-repository ppa:gift/${TRACK} -y;
	sudo apt-get update -q;

	if test ${TRAVIS_PYTHON_VERSION} = "2.7";
	then
		sudo apt-get install -y ${PYTHON2_DEPENDENCIES};
	else
		sudo apt-get install -y ${PYTHON3_DEPENDENCIES};
	fi
fi
