#!/bin/bash

set -x
set -e
set -u
set -o pipefail

folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

qsv excel cap2_ref.ods | mlrgo --c2t cat | tail -n +2 >"${folder}"/cap2_ref.tsv

awk -F '\t' 'BEGIN { OFS = "\n" }
{
    print "@misc{" $1 ",";
    print "  title = {" $2 "},";
    print "  url = {" $3 "}";
    print "}"
}'  "${folder}"/cap2_ref.tsv >"${folder}"/../../references.bib
