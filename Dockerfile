FROM docker:stable

LABEL maintainer="Dmitry Malinin <dmitry@malinin.com>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

