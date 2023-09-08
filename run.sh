set -ex

docker run -it --rm \
 --name alt-wmx \
 --hostname alt-wmx \
 -e "TARANTOOL_MEMORY_GB=1" \
 -e "WALLARM_MODE=block" \
 -e "WALLARM_API_HOST=api.wallarm.ru" \
 -e WALLARM_API_TOKEN \
 -p 80:80 \
 dmikhin/alt-wmx:latest
