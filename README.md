# KILLER-1535-UBUNTU-FIX
Quick fix for the Killer Wireless-AC 1535 on Ubuntu 16.04

## Usage
` make `

## Extra information
### Setting up wireless internet from terminal
First we need to get the network adapter's interfaces name.

Generally, the first wired network adapter interface (Ethernet) will be called eth0, but that
is not always the case. Likewise, the wireless network adapter interface is
wlan0 by default, but sometimes the interfaces are named differently. That's why you'll need to check for yourself by
running the following command:

`$ ifconfig`


Note all interfaces names down except for the one called "lo", this one should
already be set.
We'll just assume that the wired network adapter interface is eth0 and the wireless
network adapter is wlan0.

`$ sudo vim /etc/network/interfaces`

add the following at the bottom of the file:

```

# wired 
auto eth0 
iface eth0 inet dhcp

# wireless (to see available networks, run "iwlist scan")
auto wlan0
iface eth0 inet dhcp
wpa-ssid <ROUTER_SSID_HERE>
wpa-psk <WPA_KEY_HERE>

```

The way we set that up is a little clumsy, because the kernet will always
expect the ethernet cable to be plugged whenever you're booting. 
In other words, if it's not plugged, it's going to wait for a while until it
is plugged!
In order to not get stuck for 5 minutes during the boot up, do the following:

`$ sudo vim /etc/dhcp/dhclient.conf`

Look for the following line: "timeout=300"
300 seconds is way too long, just change that to 15 instead, and it'll hang
for 15 seconds at boot instead of 300 seconds if you're not connected.

Reboot, and once you reboot, connect your device to the internet using an
ethernet cable and do the following:

`$ sudo apt-get install wpasupplicant`

Then you should be good to go
