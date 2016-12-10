# rpi-telldus

A Raspberry Pi Docker image wrapping the Telldus libraries & binaries.
You need to run it i **privileged** mode, and pass it both a configuration file
to `/etc/tellstick.conf` and access to the USB bus.

Run it using something like this:

    docker run -d --privileged \
        -v $PWD/tellstick.conf:/etc/tellstick.conf \
        --device=/dev/bus/usb:/dev/bus/usb \
        hedlund/rpi-telldus

Then you can link it to another container (such as Home Assistant), 
using `volumes-from`:

    docker run -d -v $PWD:/config \
        --volumes-from telldus \
        hedlund/rpi-hass
