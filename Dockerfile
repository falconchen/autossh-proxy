FROM alpine:3.21

RUN apk add --no-cache autossh openssh-client

ENTRYPOINT autossh -M 0 -N \
    -D "0.0.0.0:${SOCKS_PORT:-1280}" \
    -o "ServerAliveInterval=${SERVER_ALIVE_INTERVAL:-30}" \
    -o "ServerAliveCountMax=${SERVER_ALIVE_COUNT_MAX:-3}" \
    -o "StrictHostKeyChecking=${STRICT_HOST_KEY_CHECKING:-accept-new}" \
    -o "ExitOnForwardFailure=yes" \
    ${SSH_EXTRA_OPTS} \
    -p "${SSH_PORT:-22}" \
    "${SSH_USER}@${SSH_HOST}"
