FROM dorowu/ubuntu-desktop-lxde-vnc

ENV home=/home/docker
COPY docker-entrypoint.sh /
RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker &&\
    echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# install boxboat/fixuid
RUN set -x && \
    ARCH=$(uname -m) && \
    case ${ARCH} in \
        x86_64) FIXUID_ARCH=linux-amd64 ;; \
        *) echo "Unsupported architecture: ${ARCH}" && exit 1 ;; \
    esac && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.6.0/fixuid-0.6.0-${FIXUID_ARCH}.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid
COPY fixuid.yml /etc/fixuid/config.yml

# install/update latest Chrome
RUN \
    ARCH=$(uname -m) && \
    case ${ARCH} in \
        x86_64) CHROME_ARCH=amd64 ;; \
        *) echo "Unsupported architecture: ${ARCH}" && exit 1 ;; \
    esac && \
    curl -SsL -o chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_${CHROME_ARCH}.deb && \
    dpkg --force-all -i chrome.deb && \
    rm chrome.deb

USER docker:docker
ENTRYPOINT [ "/docker-entrypoint.sh" ]