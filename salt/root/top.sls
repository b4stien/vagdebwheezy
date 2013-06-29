base:
  '*':
    - base
    - debian

  'roles:vagrant':
    - match: grain
    - vagrant

  'roles:postgresql':
    - match: grain
    - postgresql
