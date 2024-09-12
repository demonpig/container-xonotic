FROM registry.fedoraproject.org/fedora-minimal:40

LABEL org.opencontainers.image.authors="demonpig@fastmail.com"
LABEL org.opencontainers.image.version="20240907-f40"
LABEL org.opencontainers.image.description="Xonotic Dedicated Server"

ENV GAME_ARGS=""

COPY root/ /

RUN microdnf install -y --setopt=install_weak_deps=0 xonotic-server-${GAME_VERSION} && \
    microdnf clean all && rm -rf /var/cache/dnf

EXPOSE 26000/udp

VOLUME ["/data"]

USER games
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]