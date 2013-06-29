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

locale-gen:
  cmd.run:
    - name: /usr/sbin/locale-gen
    - user: root
    - require:
      - file: /etc/locale.gen
      - file: /etc/default/locale

/etc/timezone:
  file.managed:
    - source: salt://debian/timezone
    - user: root
    - group: root
    - mode: 644

tzdata:
  cmd.run:
    - name: dpkg-reconfigure -f noninteractive tzdata
    - user: root
    - require:
      - file: /etc/timezone