#! /usr/bin/env bash

# set -o errexit # set -e: not all non-zero exit codes are for errors
set -o pipefail
set -o nounset # set -u

SCRIPT_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
echo "$SCRIPT_HOME"
