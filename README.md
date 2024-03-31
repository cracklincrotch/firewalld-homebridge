# firewalld-homebridge
Adds the homebridge service to FirewallD.

This bash script allows you to run HomeBridge with FirewallD and not have to manage opening TCP ports manually.

Some Homebridge plugins change their ports when HomeBridge is restarted.  This script should be run as a cron job as the root user so that it will update the ports in use automatically.

I'm running this on a Rocky Linux 9.3 system but should work on any system running firewalld with some path modifications.
