set -ex

[ -f ~/.tokens ] && source ~/.tokens
docker run -it --rm \
 --name alt-wmx \
 --hostname alt-wmx \
 --net host \
 -e "TARANTOOL_MEMORY_GB=1" \
 -e "WALLARM_MODE=block" \
 -e "WALLARM_API_HOST=api.onprem.webmonitorx.ru" \
 -e "WALLARM_API_TOKEN=${NODE_TOKEN}" \
 dkr.webmonitorx.ru/webmonitorx-node/devenv-node/alt-wmx:stand
