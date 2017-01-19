FROM alpine:3.4
MAINTAINER Lumos Labs <ops@lumoslabs.com>

EXPOSE 8125/udp 8125
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/bin/start"]
RUN apk --update --purge --no-cache add \
      make \
      g++ \
      nodejs \
      python \
      su-exec \
      tini \
    && npm install -g statsd \
    && apk del --purge make g++ \
    && mkdir -v /config \
    && echo '{"debug":true,"dumpMessages":true}' | tee /config/config.js

COPY start /bin/start
