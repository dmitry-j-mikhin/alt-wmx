set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag dmikhin/alt-wmx:latest .
docker push dmikhin/alt-wmx:latest
