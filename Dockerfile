FROM debian:10
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
