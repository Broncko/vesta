# ETA Heizungsanlage

## Daten abfragen
Um Daten vom Heizkessel und den angeschlossenen Komponenten abzufragen kann sowohl die API-Schnittstelle als auch Modbus-TCP genutzt werden.

### REST API
FUB-Baum (gleiche Darstellung wie das Menü des Kessels)

[API user menu](http://192.168.178.111:8080/user/menu)

Einzelne Werte können über ```/menu/var``` abgefragt werden

http://192.168.178.111:8080/user/var/<object-uri>

Die object-uri findet man im ```/user/menu``` Baum.

Mehrere Werte können mit ```/menu/vars``` abgefragt werden

http://192.168.178.111:8080/user/var/<object-uri>
