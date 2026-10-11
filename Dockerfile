
FROM alpine:3.21

RUN apk add --no-cache curl

ARG VERSION=1.10.1

RUN curl -fsSL "https://github.com/jpillora/chisel/releases/download/v${VERSION}/chisel_${VERSION}_linux_amd64.gz" -o /tmp/chisel.gz \
    && gunzip /tmp/chisel.gz \
    && mv /tmp/chisel /usr/local/bin/chisel \
    && chmod +x /usr/local/bin/chisel \
    && rm -f /tmp/chisel.gz

ENV PORT=8080

CMD ["/bin/sh", "-c", "exec chisel server --host 0.0.0.0 --port ${PORT} --reverse --auth \"${CHISEL_AUTH}\""]
