#!/bin/bash

PWD=$(cd `dirname "$0"`/..; pwd)
PATH=${PATH}:${PWD}

DATA_ROOT=${VS_DATA_DIR:-.}
DATA_DIR=${DATA_ROOT}/variant-spark-data
DATA_INPUT_DIR=${DATA_DIR}/input

export VS_ECHO_CMDLINE=YES

variant-spark --spark --master yarn-client --num-executors 32 --executor-memory 4G --driver-memory 4G -- importance -if "${DATA_INPUT_DIR}/ranger_150000_10000.csv.bz2" -it csv -ff "${DATA_INPUT_DIR}/ranger-labels.csv" -fc resp5 -v -sp 32 -t 20
