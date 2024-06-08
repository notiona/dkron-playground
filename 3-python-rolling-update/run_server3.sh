#!/bin/bash
docker container stop dkron_python3
docker container rm dkron_python3

docker build -t dkron_python_server -f Dockerfile.server .
cur_dir=$(pwd)
docker run -d \
  -p 1236:8080 -p 8946 -p 6868 \
  --name dkron_python3 \
  --network cronnet \
  -v $cur_dir/dkron3.data:/dkron.data \
  dkron_python_server --node-name=node3