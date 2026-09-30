# Tests realises

| Test | Commande | Resultat attendu |
| --- | --- | --- |
| Docker Compose | `docker compose ps` | Services actifs |
| Node-RED | ouvrir `http://localhost:1880` | Interface accessible |
| MQTT subscribe | `mosquitto_sub` | Abonnement actif |
| MQTT publish | `mosquitto_pub` | Message recu |
| OPC UA endpoint | `opc.tcp://opcplc:50000` | Session active dans Node-RED |
| Navigation OPC UA | `ns=0;i=85` | Objets applicatifs visibles |
| Variable StepUp | `ns=3;s=StepUp` | Valeurs UInt32 lues |
| OPC UA vers MQTT | topic `industrie/opcua/stepup` | Mesures recues dans Mosquitto |
| Ports locaux | `docker ps --format ...` | Ports limites a `127.0.0.1` |
| Arret | `docker compose down` | Services arretes |

Les resultats locaux ne sont pas publies pour eviter toute information personnelle ou specifique a une machine.
