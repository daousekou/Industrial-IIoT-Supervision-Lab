# Laboratoire industriel Docker

Projet de laboratoire pour documenter un environnement industriel local avec Docker, Node-RED, OPC UA et MQTT.

Ce depot est volontairement generique. Il ne contient aucun secret, aucun chemin local personnel, aucun identifiant et aucune information liee a une entreprise.

## Objectifs

- Lancer un laboratoire local avec Docker Compose.
- Utiliser Node-RED comme outil d'automatisation visuelle.
- Ajouter un broker MQTT Mosquitto.
- Ajouter un simulateur OPC UA local.
- Lire une variable simulee dans Node-RED.
- Publier les mesures OPC UA vers MQTT.
- Documenter les ports, tests et avertissements de securite.

## Architecture

```text
.
|-- README.md
|-- docker-compose.yml
|-- docs/
|   |-- commandes.md
|   |-- securite.md
|   `-- tests-realises.md
|-- mosquitto/
|   `-- config/
|       `-- mosquitto.conf
`-- nodered/
    `-- README.md
```

## Services

| Service | Port local | Role |
| --- | --- | --- |
| Node-RED | `1880` | Automatisation visuelle |
| Mosquitto MQTT | `1883` | Broker MQTT local |
| OPC PLC Simulator | `50000` | Serveur OPC UA simule |

Les ports sont exposes sur `localhost` pour un laboratoire local. Ne pas exposer ces services directement sur Internet.

## Demarrage

```bash
docker compose up -d
```

Verifier les conteneurs :

```bash
docker compose ps
```

Ouvrir Node-RED :

```text
http://localhost:1880
```

## Tests rapides MQTT

Terminal 1 :

```bash
docker compose exec mosquitto mosquitto_sub -h localhost -t lab/test
```

Terminal 2 :

```bash
docker compose exec mosquitto mosquitto_pub -h localhost -t lab/test -m "hello industrial lab"
```

## OPC UA

Le laboratoire utilise un simulateur OPC UA local. Dans le reseau Docker, Node-RED peut le joindre avec :

```text
opc.tcp://opcplc:50000
```

Depuis la machine hote, le port est limite a l'interface locale :

```text
opc.tcp://localhost:50000
```

Exemples de NodeId utiles avec le simulateur :

```text
ObjectsFolder : ns=0;i=85
OpcPlc        : ns=3;s=OpcPlc
Telemetry     : ns=3;s=Telemetry
Basic         : ns=3;s=Basic
StepUp        : ns=3;s=StepUp
```

Le dossier `Objects` (`ns=0;i=85`) sert a parcourir les objets applicatifs. Le dossier `Types` (`ns=0;i=86`) contient surtout les types standards OPC UA.

## Flow Node-RED attendu

```text
Inject (1 seconde)
        |
        v
    OpcUa-Item
        |
        v
  OpcUa-Client
        |
        +--------> Debug
        |
        +--------> MQTT Out
                       |
                       v
                    Mosquitto
```

Parametres generiques :

- OPC UA endpoint : `opc.tcp://opcplc:50000`
- Security Mode : `SignAndEncrypt`
- Security Policy : `Basic256Sha256`
- Identite : `Anonymous`
- Variable : `ns=3;s=StepUp`
- Type : `UInt32`
- Topic MQTT : `industrie/opcua/stepup`
- QoS : `0`
- Retain : `false`

Verification MQTT :

```bash
docker compose exec mosquitto mosquitto_sub -h localhost -t industrie/opcua/stepup -C 5
```

## Problemes courants

- MQTT reste en connexion : verifier que le broker utilise le port `1883`, pas `1888`.
- OPC UA ne se connecte pas : verifier que l'endpoint utilise le nom Docker `opcplc`.
- Le Browser OPC UA liste seulement des types : partir de `ns=0;i=85`, pas `ns=0;i=86`.
- MQTT recoit `undefined` : relier MQTT a la sortie du noeud OPC UA qui contient vraiment la valeur lue.

## Arret

```bash
docker compose down
```

## Securite

Ne jamais publier :

- mots de passe Node-RED ;
- credentials MQTT ;
- endpoints OPC UA internes ;
- IP ou hostnames d'entreprise ;
- fichiers de certificats prives ;
- flows Node-RED contenant des secrets.

Voir [docs/securite.md](docs/securite.md).

## Licence

Ce projet est fourni comme support d'apprentissage. Ajouter une licence explicite avant reutilisation publique dans un contexte professionnel.
