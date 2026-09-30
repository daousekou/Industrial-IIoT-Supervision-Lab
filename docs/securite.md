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
