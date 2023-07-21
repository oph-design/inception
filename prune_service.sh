#!/bin/bash
docker kill $1
docker rm $1
docker rmi $1
exit 0
