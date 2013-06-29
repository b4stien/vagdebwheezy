base:
  '*':
    - base

  'roles:vagrant':
    - match: grain
    - vagrant

  'roles:postgresql':
    - match: grain
    - postgresql

  'os:debian':
    - match: grain
    - debian
