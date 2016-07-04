#!/bin/bash

CAFFE_ROOT=../../caffe
NETNAME=fast_v1
SOLVER=../proto/${NETNAME}_solver.prototxt
LOG=../log/${NETNAME}.log
$CAFFE_ROOT/.build_release/tools/caffe train --solver=$SOLVER --weights=$WEIGHT 2> $LOG
