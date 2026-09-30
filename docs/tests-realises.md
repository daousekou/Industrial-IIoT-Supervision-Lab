# Tests realises

| Test | Commande | Resultat attendu |
| --- | --- | --- |
| Docker Compose | `docker compose ps` | Services actifs |
| Node-RED | ouvrir `http://localhost:1880` | Interface accessible |
| MQTT subscribe | `mosquitto_sub` | Abonnement actif |
| MQTT publish | `mosquitto_pub` | Message recu |
| Arret | `docker compose down` | Services arretes |

Les resultats locaux ne sont pas publies pour eviter toute information personnelle ou specifique a une machine.
