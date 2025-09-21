FROM dorowu/ubuntu-desktop-lxde-vnc

COPY src/install_chrome.sh .
RUN ./install_chrome.sh

COPY auth/docker-entrypoint.sh /
COPY auth/desktop /root/Desktop
ENTRYPOINT [ "/docker-entrypoint.sh" ]