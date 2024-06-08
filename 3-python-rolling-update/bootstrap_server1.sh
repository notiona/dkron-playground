#!/bin/bash
docker build -t dkron_python_bootstrap -f Dockerfile.bootstrap .
cur_dir=$(pwd)
docker run -d \
  -p 1234:8080 -p 8946 -p 6868 \
  --name dkron_python1 \
  --network cronnet \
  -v $cur_dir/dkron1.data:/dkron.data \
  dkron_python_bootstrap --node-name=node1