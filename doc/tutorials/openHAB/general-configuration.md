# openHAB einrichten

## Datenaustausch openHAB -> Nodered
Events, die openHAB direkt über ein entsprechendes Binding erhält und die nicht über MQTT erfasst werden, sind für nodered erstmal nicht sichtbar. Die Option nodered über die openHAB REST API anzubinden funktioniert (Stand: 19. Jan 2021, openHAB 3) aktuell nicht.
Die Anbindung von nodered an openHAB events erfolg daher per MQTT. 

**Vorgehen:**
Alle things in openHAB dessen events per MQTT propagiert werden sollen, werden in eine Gruppe gesteckt. Für diese Gruppe wird eine Rule erstellt, die alle events der things in dieser Grupper auf den MQTT Bus legt.
Siehe auch: https://github.com/openhab/openhab-addons/blob/main/bundles/org.openhab.binding.mqtt.generic/xtend_examples.md#synchronize-two-instances