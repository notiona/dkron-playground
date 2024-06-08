#!/bin/bash
docker run -d \
  -p 1234:8080 -p 8946 -p 6868 \
  --name dkron1 \
  --network cronnet \
  dkron/dkron:4.0.0-beta5-light \
  agent --server --bootstrap-expect=1 --node-name=node1