#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

qsv excel -Q "${folder}"/../../risorse/formati-aperti.ods | mlrgo --c2m put '$Formato="**".$Formato."**"' > "${folder}"/formati-aperti.md
