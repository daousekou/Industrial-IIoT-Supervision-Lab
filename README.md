# Laboratoire industriel Docker

Projet de laboratoire pour documenter un environnement industriel local avec Docker, Node-RED, OPC UA et MQTT.

Ce depot est volontairement generique. Il ne contient aucun secret, aucun chemin local personnel, aucun identifiant et aucune information liee a une entreprise.

## Objectifs

- Lancer un laboratoire local avec Docker Compose.
- Utiliser Node-RED comme outil d'automatisation visuelle.
- Ajouter un broker MQTT Mosquitto.
- Preparer une base OPC UA pour les tests industriels.
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

Ce depot garde OPC UA comme axe documente de laboratoire, sans publier d'adresse industrielle reelle. Pour des tests futurs, utiliser un simulateur OPC UA local et des endpoints generiques comme :

```text
opc.tcp://localhost:4840
```

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
