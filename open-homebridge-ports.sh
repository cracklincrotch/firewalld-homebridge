#!/bin/bash

# Where to save the FirewallD XML configuration file for Homebridge
pathname=/etc/firewalld/services
filename=homebridge.xml

/usr/bin/echo -e '<?xml version="1.0" encoding="utf-8"?>' > $pathname/$filename
/usr/bin/echo -e '\t<service>' >> $pathname/$filename
/usr/bin/echo -e '\t\t<short>homebridge</short>' >> $pathname/$filename
/usr/bin/echo -e '\t\t<description>Homebridge ports</description>' >> $pathname/$filename

#
# Get a list of ports that are in use by Homebridge and add them to the XML configuration file

for i in $(/usr/bin/lsof -nP -iTCP -sTCP:LISTEN | /usr/bin/grep homebr | /usr/bin/grep "TCP \*:" | \
                /usr/bin/awk '{print $9}' | /usr/bin/cut -b 3- | /usr/bin/sort -n)
do
  	/usr/bin/echo -e "\t\t<port protocol=\"tcp\" port=\"$i\"/>" >> $pathname/$filename
done

/usr/bin/echo -e '\t</service>' >> $pathname/$filename

#
# Set the default SELinux security context on the file, set ownership, and reload the firewall configuration
/usr/sbin/restorecon $pathname/$filename
/usr/bin/chmod 640 $pathname/$filename
/usr/bin/firewall-cmd --reload
