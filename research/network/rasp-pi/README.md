# rasp-pi networking

- Need to make Rasp Pi accessible on the network.
  - Can use `netplan` - see sample config file at `/etc/netplan/config.yaml`.
    Will configure the WiFi.
    - If I really want to invest in running in production, probably better to
      use Ethernet... but that's a larger project. My guess is that I could
      still use `netplan`.
