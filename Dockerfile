FROM hedlund/rpi-raspbian
MAINTAINER Henrik Hedlund <henrik@hedlund.im>

# Install Telldus libraries & binaries
RUN apt-get update && apt-get install -y telldus-core libtelldus-core2 libtelldus-core-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the start script
ADD start.sh /

# Make /tmp a volume, as that's where Telldus stores it's data
VOLUME /tmp

CMD [ "/start.sh" ]
