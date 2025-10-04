FROM quay.io/nicolabeghin/docker-ubuntu-sweb:noble

# install latest chrome
COPY src/install_chrome.sh .
RUN ./install_chrome.sh

# setup autostart of chrome at Mate boot
USER ubuntu
RUN mkdir -p /home/ubuntu/.config/autostart
COPY auth/desktop /home/ubuntu/Desktop
COPY auth/desktop/.config/autostart/chrome.desktop /home/ubuntu/.config/autostart/

USER root

# enable sudo without password for default user ubuntu
RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# entrypoint to fix permissions on profile folder
COPY auth/docker-entrypoint.sh /
ENTRYPOINT [ "/docker-entrypoint.sh" ]