# syntax=docker/dockerfile:experimental
FROM dkr.webmonitorx.ru/webmonitorx-node/devenv-node/alt:c10f1

LABEL maintainer="Dmitry Mikhin <dmikhin@webmonitorx.ru>"

RUN --mount=type=bind,target=/tmp/build,source=scripts,ro \
    /tmp/build/build.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
