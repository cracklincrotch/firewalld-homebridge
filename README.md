# firewalld-homebridge
Add homebridge service to FirewallD

This bash script allows you to run HomeBridge with FirewallD and not have to manage opening ports manually.

Some Homebridge plugins change their ports when HomeBridge is restarted.  This script should be run as a cron job as the root user so that it will update the ports in use automatically.
