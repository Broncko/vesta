# Zigbee2MQTT

## Installation

1. Login auf pi oder entsprechendem System
2. Checken welche ID der Stick hat via
```bash
ls -lsa /dev/serial/by-id/
```
3. Der Zigbee (conbee, c2531, etc.) sollte in der Liste auftauchen
3a. Alternativ kann der Stick auch per default eingebunden werden (/dev/ttyACM0)

## Inbetriebname

## Troubleshooting
### Fehler: Error while opening serialport
```
Zigbee2MQTT:info  2021-01-11 21:08:09: Starting Zigbee2MQTT version 1.17.0 (commit #07cdc9d)
Zigbee2MQTT:info  2021-01-11 21:08:09: Starting zigbee-herdsman (0.13.46)
CREATED DECONZ ADAPTER
Zigbee2MQTT:error 2021-01-11 21:08:10: Error while starting zigbee-herdsman
Zigbee2MQTT:error 2021-01-11 21:08:10: Failed to start zigbee
Zigbee2MQTT:error 2021-01-11 21:08:10: Exiting...
Zigbee2MQTT:error 2021-01-11 21:08:10: Error: Error while opening serialport 'Error: Error Resource temporarily unavailable Cannot lock port'
```

### Lösung
- Checken ob nicht doch ein npm process auf den port lauscht oder wenn mit npm start getestet wird der Port nicht noch vom service geblockt ist
- USB Verlängerungskabel für den conbee2

## Quellen

1. https://www.zigbee2mqtt.io/getting_started/running_zigbee2mqtt.html