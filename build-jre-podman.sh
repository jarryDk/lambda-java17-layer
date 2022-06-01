#!/bin/bash

podman build --progress=plain -t jre17-al2-slim -f ./Dockerfile
mkdir layer/tmp -p
podman run --privileged  -v $(pwd)/layer:/tmp -it jre17-al2-slim sh -c "cp /opt/jre-17-slim.zip /tmp"