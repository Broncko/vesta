# Zigbee2MQTT

## Installation

1. Login auf pi oder entsprechendem System
2. Checken welche ID der Stick hat via
```bash
ls -lsa /dev/serial/by-id/
```
3. Der Zigbee (conbee, c2531, etc.) sollte in der Liste auftauchen
3a. Alternativ kann der Stick auch per default eingebunden werden (/dev/ttyACM0)

## Quellen

1. https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html