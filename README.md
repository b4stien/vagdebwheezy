# A Debian Wheezy Vagrant Box

## What is it ?

A box and some salt recipes to set up a really simple vagrant box with
Debian 7.1.

## Install

    git clone git@github.com:b4stien/vagdebwheezy.git
    cd vagdebwheezy
    vagrant plugin install vagrant-salt-0.4.0.gem
    vagrant up

Or, if you're really lazy:

    curl -s http://git.io/31mlGA | sh

## vagrant-salt

vagrant-salt (a vagrant plugin to use salt as a provision system) is
included as a pre-built gem because mainstream version does not support
Debian 7.x yet. Dev version can be found on [GitHub](https://github.com/saltstack/salty-vagrant).
