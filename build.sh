#!/bin/bash

set -e

docker build -t hedlund/rpi-telldus:latest .
docker push hedlund/rpi-telldus:latest
