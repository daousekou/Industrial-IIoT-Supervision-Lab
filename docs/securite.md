# Securite

Ce laboratoire est prevu pour un usage local.

## Ne pas exposer directement

- Node-RED sur Internet ;
- MQTT sans authentification ;
- endpoints OPC UA industriels ;
- ports Docker sur une interface publique.

## Ne pas publier

- mots de passe ;
- tokens ;
- certificats prives ;
- IP internes ;
- hostnames internes ;
- flows Node-RED avec credentials ;
- details non publics d'un employeur ou client.

## Notes MQTT

Le fichier `mosquitto.conf` autorise l'acces anonyme uniquement pour simplifier un laboratoire local. Pour un usage reel, activer l'authentification, TLS et des ACL.

## Notes OPC UA

Utiliser des simulateurs locaux pour les demonstrations publiques. Remplacer les endpoints reels par des endpoints generiques comme `opc.tcp://localhost:4840`.

L'option `--autoaccept` du simulateur OPC UA facilite les essais en laboratoire, mais ne doit pas etre reprise telle quelle dans un environnement reel.

## Exposition reseau

Les ports du laboratoire sont publies sur `127.0.0.1` afin de limiter l'exposition a la machine locale :

- Node-RED : `127.0.0.1:1880`
- MQTT : `127.0.0.1:1883`
- OPC UA : `127.0.0.1:50000`
