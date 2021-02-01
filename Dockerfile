FROM docker.io/library/fedora:33

COPY python-mqtt-gpio/ /var/srv/pi-mqtt-gpio/

WORKDIR /var/srv/pi-mqtt-gpio

RUN dnf install -y libgpiod libgpiod-devel libgpiod-c++ python3-libgpiod python3-pip && \
  pip install -r /var/srv/pi-mqtt-gpio/requirements.txt && \
  pip install gpiod && \
  dnf clean all

CMD [ "/usr/bin/python3", "-m", "pi_mqtt_gpio.server", "config.yml" ]
