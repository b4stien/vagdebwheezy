zsh-set:
  cmd.run:
    - name: 'chsh -s /bin/zsh vagrant && cp /etc/zsh/zshrc /home/vagrant/.zshrc'
    - user: root
    - require:
      - pkg: zsh
      - cmd: zsh-config

virtualenvwrapper-set:
  cmd.run:
    - name: cat /etc/zsh/virtualenvwrapper >> /home/vagrant/.zshrc && touch /root/virtualenvwrapper_done
    - user: root
    - unless: cat /root/virtualenvwrapper_done
    - require:
      - cmd: zsh-set
      - file: /etc/zsh/virtualenvwrapper
