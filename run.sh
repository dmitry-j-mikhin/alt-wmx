set -ex

[ -f ~/.tokens ] && source ~/.tokens
docker run -it --rm \
 --name alt-wmx \
 --hostname alt-wmx \
 -v "`realpath certs`":/certs \
 -v "`realpath basic-auth`":/basic-auth \
 -e "TARANTOOL_MEMORY_GB=1" \
 -e "WALLARM_MODE=block" \
 -e "WALLARM_API_HOST=api.wallarm.ru" \
 -e "WALLARM_API_TOKEN=${NODE_TOKEN}" \
 -p 80:80 \
 dkr.webmonitorx.ru/webmonitorx-node/devenv-node/alt-wmx:stand
