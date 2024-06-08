#!/bin/bash
docker build -t dkron_server -f Dockerfile.server .
cur_dir=$(pwd)
docker run -d \
  -p 1236:8080 -p 8946 -p 6868 \
  --name dkron3 \
  --network cronnet \
  -v $cur_dir/dkron3.data:/dkron.data \
  dkron_server --node-name=node3