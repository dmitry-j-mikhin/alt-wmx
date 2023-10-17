set -ex

[ -f ~/.tokens ] && source ~/.tokens
docker run -it --rm \
 --name alt-wmx \
 --hostname alt-wmx \
 -e "TARANTOOL_MEMORY_GB=1" \
 -e "WALLARM_MODE=block" \
 -e "WALLARM_API_HOST=api.wallarm.ru" \
 -e "WALLARM_API_TOKEN=${NODE_TOKEN}" \
 -p 80:80 \
 wmx-public.gitlab.yandexcloud.net:5050/wmx-public/container-images/alt-wmx:tests
