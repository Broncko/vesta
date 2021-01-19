# openHAB known issues

## Keine Werte auf dem Dashboard

Wenn die Option Einstellungen -> API security -> Implicit user role for unauthenticated requests deaktiviert ist, knallt das Dashboard weil die Requests gegen die API mit nem 401(unauthorized) beantwortet werden. Siehe https://community.openhab.org/t/solved-oh3-new-ui-not-displaying-item-states/107906/3