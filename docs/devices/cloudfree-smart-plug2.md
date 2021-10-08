# cloudfree-smart-plug2

## Source

https://cloudfree.shop/product/cloudfree-smart-plug-runs-tasmota/

## Edits to manual

- Follow initial setup instructions via manual.
- Configure Tasmota w/ MQTT via [docs](https://tasmota.github.io/docs/MQTT/).
  Be sure to specify a better "Friendly Name" than
  the generic "Tasmota".

## Home Assistant

- Some machine (currently same Rasp-Pi as running Home Assistant) must be running an Mqtt broker (see
  https://www.vultr.com/docs/how-to-install-mosquitto-mqtt-broker-server-on-ubuntu-16-04).
  This should be done via Ansible.
- Home Assistant should be configured to use this broker via the Mqtt
  integration (which should also happen via Ansible), but for now, I did it via
  the UI.
- Need to be configured w/ the Tasmota Integration, which should also happen via
  configuration file.
  - After doing this, Tasmota, will automatically add devices.

## Configuring w/ Home Assistant

- I wonder if I need to setup a MQTT broker?
- Alternatively, I wonder if I homeassistant container is running into
  permissions issues... (i.e. why is it unable to install the `tasmota` plugin)?
