# Script to set up tests on AppVeyor MacOS.

set -e

brew update -q
brew install -q gettext gnu-sed python@${PYTHON_VERSION} tox || true

