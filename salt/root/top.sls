base:
  '*':
    - base
    - debian
    - python

  'roles:vagrant':
    - match: grain
    - vagrant

  'roles:gandi':
    - match: grain
    - gandi

  'roles:postgresql':
    - match: grain
    - postgresql

  'roles:redis':
    - match: grain
    - redis

  'roles:nginx':
    - match: grain
    - nginx
