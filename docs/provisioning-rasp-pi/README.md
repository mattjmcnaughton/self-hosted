# provisioning-rasp-pi

## Operating System and Creating Bootable Media

- Currently, we are using the latest Ubuntu LTS for our Raspberry Pis. You can
  find images for the microSD card [here](https://ubuntu.com/download/raspberry-pi).
- Create bootable SD card w/ the following:
  - Identify microsd via `sudo fdisk -l`. For tutorial, assume `/dev/sdX`
  - Ensure we've decompressed the image file. For example, if compressed via
    `xz`, run `unxz PATH`.
  - Ensure `/dev/sdX` is not mounted with `sudo umount /dev/sdX`.
  - Copy the image with `sudo dd bs=4M status=progress if=PATH_TO_IMG
    of=/dev/sdX`.

## First Boot

- We will need the following for our first boot:
  - USB Keyboard/Mouse
  - Monitor w/ HDMI port
  - HDMI to micro HDMI cord.
- Login w/ `ubuntu:ubuntu` when the Rasp Pi boots.
- We need some way of establishing an internet connection. If we are not using
  Ethernet, it'll be WiFi. To configure WiFi, perform the following as the root
  user:
  - `wpa_passphrase "SSID" "PASSWD" > /etc/wpa_supplicant/wpa_supplicant.conf"
  - `wpa_supplicant -B -wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf"
  - `sudo dhclient wlan0`
- The machine should now be connected to the Internet - verify via `ping`.
- Verify that `ssh` is running via `sudo systemctl status ssh.service`. It
  should display `active (running)`.
- Determine the IP address of the machine. It should be either `10.0.0.X` or
  `192.168.0.X`. You can either use `ifconfig` (you may need to install
  `net-tools`) on the Pi, `ip addr` on the Pi,
  or run `nmap -Pn -p 22 --open -sV (10.0.0.0/24|192.168.0.0/24)`
  on the machine from which we will run the `rasp-pi-from-scratch.yml` playbook.
  - We need to `-Pn` because, after we turn on the firewall, we've blocked the
    port that `nmap` uses to send pings to determine if the host is up. `-Pn`
    skips the up check.

## Running init-from-scratch playbook

- TBD

## Running configuration playbook

- Run a playbook which applies both the `mattjmcnaughton.rasp-pi-cleanup` and
  `mattjmcnaughton-rasp-pi-base` roles.
