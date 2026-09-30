# Commandes reproductibles

## Demarrer

```bash
docker compose up -d
```

## Verifier

```bash
docker compose ps
docker compose logs -f
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

## Tester MQTT

Terminal 1 :

```bash
docker compose exec mosquitto mosquitto_sub -h localhost -t lab/test
```

Terminal 2 :

```bash
docker compose exec mosquitto mosquitto_pub -h localhost -t lab/test -m "hello industrial lab"
```

## Ouvrir Node-RED

```text
http://localhost:1880
```

## Verifier OPC UA

Endpoint depuis Node-RED :

```text
opc.tcp://opcplc:50000
```

Endpoint depuis la machine hote :

```text
opc.tcp://localhost:50000
```

NodeId de depart pour parcourir les objets :

```text
ns=0;i=85
```

Variable simulee utile :

```text
ns=3;s=StepUp
```

## Tester la publication OPC UA vers MQTT

```bash
docker compose exec mosquitto mosquitto_sub -h localhost -t industrie/opcua/stepup -C 5
```

## Arreter

```bash
docker compose down
```

## Nettoyer les volumes locaux

Attention : cette commande supprime les donnees locales du laboratoire.

```bash
docker compose down -v
```
