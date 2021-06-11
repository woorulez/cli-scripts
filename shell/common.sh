#! /usr/bin/env bash

set -o errexit # set -e
set -o pipefail
set -o nounset # set -u

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
echo "$SCRIPT_DIR"
