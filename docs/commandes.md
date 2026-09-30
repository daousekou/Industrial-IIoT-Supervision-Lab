# Commandes reproductibles

## Demarrer

```bash
docker compose up -d
```

## Verifier

```bash
docker compose ps
docker compose logs -f
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

## Arreter

```bash
docker compose down
```

## Nettoyer les volumes locaux

Attention : cette commande supprime les donnees locales du laboratoire.

```bash
docker compose down -v
```
