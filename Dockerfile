FROM docker.io/library/fedora:32

COPY python-mqtt-gpio/ /var/srv/python-mqtt-gpio/

WORKDIR /var/srv/python-mqtt-gpio

RUN dnf install -y libgpiod libgpiod-devel libgpiod-c++ python3-libgpiod python3-pip && \
  pip install -r /var/srv/python-mqtt-gpio/requirements.txt && \
  dnf clean all

CMD [ "/usr/bin/python3", "-m", "pi_mqtt_gpio.server", "config.yml" ]
