postgresql:
  pkg:
    - installed

/etc/postgresql/9.1/main/pg_hba.conf:
  file.managed:
    - source: salt://postgresql/conf/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 640
    - require:
      - pkg: postgresql

/etc/postgresql/9.1/main/postgresql.conf:
  file.managed:
    - source: salt://postgresql/conf/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: 644
    - require:
      - pkg: postgresql

{% if 'vagrant' in grains['roles'] %}

/etc/postgresql/9.1/main/root.sql:
  file.managed:
    - source: salt://postgresql/root.sql
    - user: root
    - group: root
    - mode: 666
    - require:
      - pkg: postgresql

root-user:
  cmd.run:
    - name: su postgres -c 'psql -f /etc/postgresql/9.1/main/root.sql' && touch /root/postgresql_root_done
    - user: root
    - unless: cat /root/postgresql_root_done
    - require:
      - file: /etc/postgresql/9.1/main/root.sql

reload-postgres:
  cmd.run:
    - name: service postgresql restart && touch /root/postgresql_config_reload_done
    - user: root
    - unless: cat /root/postgresql_config_reload_done
    - require:
      - cmd: root-user
      - file: /etc/postgresql/9.1/main/postgresql.conf
      - file: /etc/postgresql/9.1/main/pg_hba.conf

{% else %}

reload-postgres:
  cmd.run:
    - name: service postgresql restart && touch /root/postgresql_config_reload_done
    - user: root
    - unless: cat /root/postgresql_config_reload_done
    - require:
      - file: /etc/postgresql/9.1/main/postgresql.conf
      - file: /etc/postgresql/9.1/main/pg_hba.conf

{% endif %}
