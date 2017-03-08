#!/bin/sh
# Script to run tests

git clone https://github.com/log2timeline/plaso.git

# Set the following environment variables to build pycrypto and yara-python.
export CFLAGS="-I/usr/local/include -I/usr/local/opt/openssl@1.1/include ${CFLAGS}";
export LDFLAGS="-L/usr/local/lib -L/usr/local/opt/openssl@1.1/lib ${LDFLAGS}";
export TOX_TESTENV_PASSENV="CFLAGS LDFLAGS";

# Set the following environment variables to ensure tox can find Python 3.9.
export PATH="/usr/local/opt/python@3.9/bin:${PATH}";

cd plaso && tox -e py39
