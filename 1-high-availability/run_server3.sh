#!/bin/bash
docker run -d \
  -p 1236:8080 -p 8946 -p 6868 \
  --name dkron3 \
  --network cronnet \
  dkron/dkron:4.0.0-beta5-light \
  agent --server --bootstrap-expect=3 --node-name=node3 \
  --retry-join=dkron1:8946 --retry-join=dkron2:8946 --retry-join=dkron3:8946