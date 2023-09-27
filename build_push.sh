set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag dmikhin/alt-wmx:stand .
docker push dmikhin/alt-wmx:stand
