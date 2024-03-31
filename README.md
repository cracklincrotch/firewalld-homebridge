# firewalld-homebridge
Add homebridge service to FirewallD

This bash script allows you to run HomeBridge with FirewallD and not have to manage opening ports manually.

Some HomeBridge plugins change their ports when HomeBridge is restarted.  This script installed in a cron job will update the ports in use automatically.
