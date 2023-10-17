set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag wmx-public.gitlab.yandexcloud.net:5050/wmx-public/container-images/alt-wmx:tests .
docker push wmx-public.gitlab.yandexcloud.net:5050/wmx-public/container-images/alt-wmx:tests
