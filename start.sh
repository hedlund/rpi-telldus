#!/bin/bash

# Start the telldus daemon
/etc/init.d/telldusd start

# Just to keep the process running
tail -f /var/log/faillog
#CMD ["/usr/sbin/sshd", "-D"]
