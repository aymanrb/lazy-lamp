#!/bin/bash
#
#Script to automate the DNS server changes to a list of Free & Public DNS Servers
#
# @aymanrb - 2014 / 12 / 25
#
declare -A servers

servers["Google.primary"]="8.8.8.8"
servers["Google.secondary"]="8.8.4.4"

servers["DnsWatch.primary"]="84.200.69.80"
servers["DnsWatch.secondary"]="84.200.70.40"

servers["OpenDNS.primary"]="208.67.222.222"
servers["OpenDNS.secondary"]="208.67.220.220"

servers["NortonConnectSafe.primary"]="199.85.126.30"
servers["NortonConnectSafe.secondary"]="199.85.127.30"

servers["ComodoSecure.primary"]="8.26.56.26"
servers["ComodoSecure.secondary"]="8.20.247.20"

servers["Cloudflare.primary"]="1.1.1.1"
servers["Cloudflare.secondary"]="1.0.0.1"


declare -A serverIndex
serverIndex[1]="Google"
serverIndex[2]="DnsWatch"
serverIndex[3]="OpenDNS"
serverIndex[4]="NortonConnectSafe"
serverIndex[5]="ComodoSecure"
serverIndex[6]="Cloudflare"


for i in "${!serverIndex[@]}"
do
  echo "Code: '$i' from ${serverIndex[$i]}"
done

echo "
=====================================================
"

read -p "Select a server from the list above to apply its settings [1-5] (e.g. 3): " applyServer

echo "

Applying your selection. (${serverIndex[$applyServer]} Server(s))

.........................
"

echo "nameserver ${servers["${serverIndex[$applyServer]}.primary"]}" | sudo tee /etc/resolvconf/resolv.conf.d/head
echo "nameserver ${servers["${serverIndex[$applyServer]}.secondary"]}" | sudo tee -a /etc/resolvconf/resolv.conf.d/head

sudo resolvconf -u

echo "DNS Changes applied successfully !"


