#!/bin/bash

#================================================================
#   FileName:gen_pb.sh
#   Description: protoc version libprotoc 3.6.1
#      usage: gen_pb.sh [origin protobuf file path]
#      example: ./gen_pb.sh example/addressbook.proto
#================================================================

base=$(cd $(dirname $0);pwd)
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:${base}/lib

if [ $# -ne 1 ];then
    echo "Usage: $0 [proto_file]"
    exit -1
fi

if [ ! -d ${base}/output ];then
    mkdir ${base}/output
    if [ $? -ne 0 ];then
        echo "create ${base}/output failed"
        exit -1
    fi
fi

proto_file=$1
proto_path=$(dirname ${proto_file})
${base}/lib/protoc ${proto_file} --python_out=${base}/output -I${proto_path}
#${base}/lib/protoc ${proto_file} --cpp_out=${base}/output -I${proto_path}
#${base}/lib/protoc ${proto_file} --java_out=${base}/output -I${proto_path}
if [ $? -ne 0 ];then
    echo "generate protofile error!"
    exit -1
fi

echo "generate protofile successfully! Check at ${base}/output"
