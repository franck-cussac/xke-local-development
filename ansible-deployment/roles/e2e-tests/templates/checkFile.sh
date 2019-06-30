#!/usr/bin/env bash

hdfs dfs -test -e {{ output_file }}

res=$?

if [[ "${res}" = "0" ]]; then
    echo "every thing is ok"
    exit 0
fi

echo "ERROR : file {{ output_file }} does not exist"
exit 1
