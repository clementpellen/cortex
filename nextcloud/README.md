## Introduction

🌥️ Le projet NextCloud est un projet de stockage de fichiers en ligne. 
Il permet de stocker des fichiers sur un serveur distant et 
de les synchroniser sur des appareils locaux. 

Il est pensé pour être déployé sur l'OS **Raspberry Pi Lite** 
et sur une **Raspberry Pi 5 ARM64**.

Le déploiement de NextCloud se fait à l'aide de `docker-compose`
et d'un fichier `docker-compose.yml` qui définit les services
suivants :
- `nextcloud`: le service NextCloud
- `db`: le service de base de données MariaDB
- `redis`: le service de cache Redis
- `apache`: le service de serveur web Apache

L'image de l'OS est personnalisée 
à l'aide de l'outil `Packer` 
pour installer les packages nécessaires :
- `docker`
- `docker-compose`
- `git`

Le développement et le build du projet se font 
sur un environnement **WSL (Windows Subsystem for Linux)**
avec `Ubuntu 24.04 LTS`. L'OS repose sur un CPU 
avec architecture AMD64.

> /!\ /!\ /!\ **CHANGEMENT** :
> Ubuntu **24.04 LTS** est nécessaire pour
la partie *Installation de Ansible sur WSL*.

## Prérequis

- Disposer d'une Raspberry Pi 5 ARM64
- Disposer d'une carte SD et d'un adaptateur USB
- Disposer d'un environnement de développement WSL Ubuntu 20.04 LTS
- Disposer d'un câble Ethernet

## Premier boot du Raspberry Pi

1. Télécharger `Raspberry Pi Imager` sur le site officiel : 

https://www.raspberrypi.com/software/

Personnellement, j'ai installé la version pour Windows en dehors de WSL.

2. Lancer `Raspberry Pi Imager` et :
    - [Choisir le Modèle] : `Raspberry Pi 5`
    - [Choisir l'OS] : `Raspberry Pi OS (other) > Raspberry Pi OS Lite (64-bit)`
    - [Choisir le stockage] : `Sélectionner la carte SD`

3. Définir le fichier `ssh` :
    - `username` : `cleme`
    - `password` : 
    
    TODO: Cette partie est à préciser

4. Flasher la carte SD

5. Se connecter au Raspberry Pi en SSH :

Patienter environ 1 minute après le flashage de la carte SD puis :

```bash
ssh cleme@192.168.1.62
```

> Quelque soit le réseau, l'adresse IP du Raspberry Pi est toujours `192.168.1.62`
>
> La raison de cette IP fixe nous reste inconnue.

**A ce stade, vous devriez être parvenu à vous connecter
une première fois au Raspberry Pi ! 👏**

## Spécialisation de l'image OS

L'objectif de la spécialisation de l'image OS
est d'installer les packages nécessaires au déploiement
de NextCloud lors du boot du Raspberry Pi.

1. Installer `Packer` sur l'environnement de développement :

Sur WSL Ubuntu 20.04 LTS, installer `Packer` depuis le repository HashiCorp :
https://releases.hashicorp.com/packer/

Pour cela, suivre la documentation suivante:

- [https://medium.com/how-to-build-a-custom-raspberry-pi-os-image-using-packer](https://medium.com/@source4learn/how-to-build-a-custom-raspberry-pi-os-image-using-packer-da83be261687)


2. Utilisation de Packer

Packer est un outil open-source pour automatiser 
la création d'images de machines virtuelles.
Il se base sur des fichiers de configuration JSON
qui décrivent les étapes de création de l'image.

Les 3 étapes de création de l'image sont les suivantes :
- `variables` : définit les éléments de configuration à variabiliser en fonction du contexte
- `builders` : définit l'image de base à partir de laquelle créer l'image personnalisée
- `provisioners` : définit les étapes personnalisées de configuration de l'image

**Documentation Packer** : https://developer.hashicorp.com/packer/docs


3. Notre configuration Packer

Le fichier de configuration `packer_raspberry_pi_os_lite.json`
définit les étapes de personnalisation de l'image suivantes :

- Mise-à-jour de Apt et installation des packages :
    - `git`
    - `ca-certificates`
    - `curl`

- Copie du script d'installation officiel
de `docker` et `docker-compose` sur le Raspberry Pi :
    - `install_docker_plugins.sh`

Le script `install_docker_plugins.sh` est copié 
dans le répertoire `/usr/local/bin/`

- Copie et exécution des services 
`docker-plugins.service` et `docker-compose.service`
pour démarrer les services Docker au boot du Raspberry Pi.

Ces services sont copiés 
dans le répertoire `/etc/systemd/system/`


4. Lancer la création de l'image

```bash
sudo packer build packer_raspberry_pi_os_lite.json
```


## Installation de Ansible sur WSL

**J'installe Ansible avec Python 3.12.3
sur WSL Ubuntu 24.04 LTS**

> /!\ /!\ /!\ J'ai dû monter Ubuntu en version **24.04** LTS
> pour disposer de Python 3.12.3 et Ansible version 11 (la version actuelle)

<br>

1. Créer un environnement virtuel Python pour 
le projet NextCloud :

```bash
python -m venv <PATH_DU_PROJET_NEXTCLOUD>/.venv
```

> Cette commande n'est nécessaire qu'une seule fois
> pour créer l'environnement virtuel.


2. Activer l'environnement virtuel

```bash
source <PATH_DU_PROJET_NEXTCLOUD>/.venv/bin/activate
```

3. Mettre `pip` à jour et disposer des *pip-tools* :

```bash
pip install --upgrade pip
pip install pip-tools
```

Parmi les *pip-tools*, on utilise `pip-compile` pour définir
les dépendances du projet NextCloud dans le fichier `requirements.txt`

4. Mettre à jour les dépendances du projet NextCloud :

```bash
pip-compile requirements.in
pip install -r requirements.txt
```

## Déploiement de NextCloud

Partie de Quentin 😊


## Notes

- Lire les logs des services: 
```bash
journalctl -u docker-plugins.service
journalctl -u docker-compose.service
```

- Supprimer la signature du Raspberry Pi après un reboot :
```bash
ssh-keygen -f "/home/<user>/.ssh/known_hosts" -R "192.168.1.62"
```
