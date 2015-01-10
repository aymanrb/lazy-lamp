#!/bin/bash
#
# Clears the Google Apache Mod-PageSpeed cache automtically 
#
# @aymanrb - 2015 / 01 / 10
#

sudo -v

if apache2ctl -M | grep "pagespeed"; then   

sudo touch `grep "^ *ModPagespeedFileCachePath" /etc/apache2/mods-enabled/pagespeed.conf | awk ' { print $2; } ' | sed 's/"//g'`/cache.flush

echo "Done, Pagespeed caches have been flushed and will be recreated on your next web access"

else

echo "Pagespeed Apache Module is not loaded. Visit: https://developers.google.com/speed/pagespeed/module for more info"

fi
