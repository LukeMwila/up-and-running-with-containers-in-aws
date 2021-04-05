#!/bin/sh
echo Building lukondefmwila/react:build 

docker build -t lukondefmwila:build . -f Dockerfile.build 

docker create --name extract lukondefmwila:build

docker cp extract:/app/build ./app 

docker rm -f extract 

echo Building lukondefmwila/react:latest

docker build --no-cache -t lukondefmwila/react:latest . -f Dockerfile.main