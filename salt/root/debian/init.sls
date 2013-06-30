/etc/default/locale:
  file.managed:
    - source: salt://debian/locales/locale
    - user: root
    - group: root
    - mode: 644

/etc/locale.gen:
  file.managed:
    - source: salt://debian/locales/locale.gen
    - user: root
    - group: root
    - mode: 644

locale_gen:
  cmd.run:
    - name: /usr/sbin/locale-gen && touch /root/locale_gen_done
    - user: root
    - unless: cat /root/locale_gen_done
    - require:
      - file: /etc/locale.gen

/etc/timezone:
  file.managed:
    - source: salt://debian/timezone
    - user: root
    - group: root
    - mode: 644

tzdata:
  cmd.run:
    - name: dpkg-reconfigure -f noninteractive tzdata && touch /root/tzdata_done
    - user: root
    - unless: cat /root/tzdata_done
    - require:
      - file: /etc/timezone