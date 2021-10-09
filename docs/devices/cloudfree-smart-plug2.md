# cloudfree-smart-plug2

## Source

https://cloudfree.shop/product/cloudfree-smart-plug-runs-tasmota/

## Prerequisites

- Note, we're assuming that a MQTT broker is already running. See the
  `mattjmcnaughton.mqtt` ansible role for provisioning this broker. Currently,
  it's running on the same machine as the homeassistant container. It could
  theoretically be a different Rasp Pi later.
- We assume Home Assistant has been configured to use this mqtt integration, via
  the [mqtt integration](https://www.home-assistant.io/integrations/mqtt/).
- We assume that the [Tasmota integration](https://www.home-assistant.io/integrations/tasmota/)
  has already been configured for Home Assistant.

## Setup instructions

- Follow initial setup instructions via manual.
- Configure Tasmota w/ MQTT via [docs](https://tasmota.github.io/docs/MQTT/).
  Be sure to specify a better "Friendly Name" than
  the generic "Tasmota".

## Pairing w/ Home Assistant

- Device should be automatically discovered, assuming that all of the
  prerequisites are met.
