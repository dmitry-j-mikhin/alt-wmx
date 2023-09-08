set -ex

DOCKER_BUILDKIT=1 docker build --pull \
 --tag dmikhin/alt-wmx:latest .
docker push dmikhin/alt-wmx:latest
