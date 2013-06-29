# Debian Wheezy Vagrant Box

## Kezako ?

Une box vagrant avec Debian Wheezy (7.1, x64) avec quelques directives
Salt pour les options par défaut.

## Installation

    git clone git@github.com:b4stien/vagdebwheezy.git
    cd vagdebwheezy
    vagrant plugin install vagrant-salt-0.4.0.gem
    vagrant up

Ou, pour les grands faineants:

    curl -s http://git.io/31mlGA | sh

## Customisation

Deux rôles facultatifs sont spécifiables dans `salt/minion_config`:

* vagrant: Configure par défaut un shell sexy pour l'utilisateur vagrant.
* postgresql: Installe Postgresql 9.1. Si le rôle 'vagrant' est attribué, crée
  un superutilisateur 'root' (avec le password 'root') et configure Postgresql
  pour écouter sur toutes les interfaces et faire la vérification des identités
  avec des password en md5.

## Configuration par défaut

* timezone: Europe/Paris
* locales: en_GB.UTF-8, fr_FR.UTF-8 et en_US.UTF-8 (défaut)
* packages: vim, curl, zsh, python-pip

## vagrant-salt

vagrant-salt (un plugin vagrant pour utiliser salt en tant que système
de provision) est inclu sous forme de gem, principalement parce que la
version actuellement disponible dans les repo de vagrant ne supporte pas
encore Debian 7.

La version de dev de ce plugin se trouve sur
[GitHub](https://github.com/saltstack/salty-vagrant).
