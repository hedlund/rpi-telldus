FROM resin/rpi-raspbian
MAINTAINER Henrik Hedlund <henrik@hedlund.im>

ENV ARCH=arm
ENV CROSS_COMPILE=/usr/bin/

# Install Tellstick
RUN apt-get update && apt-get install -y build-essential wget ssh && \
	echo "deb http://download.telldus.com/debian/ stable main" >> /etc/apt/sources.list.d/telldus.list && \
    wget -qO - http://download.telldus.se/debian/telldus-public.key | apt-key add - && \
    apt-get update && apt-get install -y telldus-core libtelldus-core2 libtelldus-core-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add the start script
ADD start.sh /

# Make /tmp a volume, as that's where Telldus stores it's data
VOLUME /tmp

CMD [ "/start.sh" ]
