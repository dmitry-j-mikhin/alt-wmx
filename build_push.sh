set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag dkr.webmonitorx.ru/webmonitorx-node/devenv-node/alt-wmx:stand .
docker push dkr.webmonitorx.ru/webmonitorx-node/devenv-node/alt-wmx:stand
