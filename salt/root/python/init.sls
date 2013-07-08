setuptools:
  cmd.run:
    - name: wget https://bitbucket.org/pypa/setuptools/raw/0.8/ez_setup.py -O - | python
    - user: root
    - unless: python -c 'import setuptools'

pip:
  cmd.run:
    - name: curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py
    - user: root
    - unless: which pip
    - require:
      - cmd: setuptools

virtualenvs:
  cmd.run:
    - name: pip install virtualenvwrapper
    - user: root
    - unless: python -c 'import virtualenv'
    - require:
      - cmd: pip

/etc/zsh/virtualenvwrapper:
  file.managed:
    - source: salt://python/virtualenvwrapper
    - user: root
    - group: root
    - mode: 666
    - require:
      - pkg: zsh
