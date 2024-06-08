#!/bin/bash
docker build -t dkron_server -f Dockerfile.server .
cur_dir=$(pwd)
docker run -d \
  -p 1235:8080 -p 8946 -p 6868 \
  --name dkron2 \
  --network cronnet \
  -v $cur_dir/dkron2.data:/dkron.data \
  dkron_server --node-name=node2