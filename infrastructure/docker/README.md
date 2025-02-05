# Docker compose pour Nextcloud

## Build

Le projet peut etre build avec la commande suivante :

```shell
make up
```

Les options suivantes sont aussi dispo :

```shell
make down
```

```shell
make logs
```

```shell
make rebuild
```

```shell
make ps
```

```shell
make clean
```

### ARM64 vs AMD64

Deux fichiers `docker-compose` existent, l'un pour **ARM64** et l'autre pour **AMD64**.
Ainsi en fonction de l'architecture hote on peut alterner et faire varier les images `mariadb` et `nextcloud`.

## Architecture

Ce dossier contient les fichiers pour construire les services suivants :

- Nextcloud : Plateforme cloud auto-hébergée (port 8081)
- MariaDB : La base de donnée de management pour NextCloud
- Redis : Cache mémoire pour les documents != text + optimisation
- Nginx Proxy Manager : Gère le proxy et les certificats SSL

> **ℹ️ Particularité réseau et stockage**
>
> - Tous les services communiquent via le réseau cloud.
> - Les volumes garantissent la persistance des données (fichiers, base de données, cache et certificats SSL).
