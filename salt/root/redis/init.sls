redis-server:
  pkg:
    - installed

{% if 'vagrant' in grains['roles'] %}
/etc/redis/redis.conf
  file.managed
    - source: salt://redis/redis.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: redis-server

reload-redis:
  cmd.run:
    - name: service redis-server restart && touch /root/redis_config_reload_done
    - user: root
    - unless: cat /root/redis_config_reload_done
    - require:
      - file: /etc/redis/redis.conf
{% endif %}
