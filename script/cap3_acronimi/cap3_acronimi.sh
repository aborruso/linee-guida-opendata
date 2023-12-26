#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

qsv excel -Q ../../risorse/acronimi.ods | mlrgo --c2m put '$acronimo="**".$acronimo."**"' > "$folder"/acronimi.md
