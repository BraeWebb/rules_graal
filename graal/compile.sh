#!/bin/bash

cmd=${@:3}
cmd="${cmd} -H:CCompilerPath=$(realpath $1)"
 
if [ -n "$2" ]; then
    cmd="${cmd} -H:DumpPath=$2"
fi

${cmd}

if [ -n "$2" ]; then
    if [ ! -d "$2" ]; then
        echo "Dump directory not created, ensure that -H:Dump and -H:MethodFilter arguments are given"
        exit 2
    fi
fi
