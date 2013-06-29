zsh-set:
  cmd.run:
    - name: 'chsh -s /bin/zsh vagrant && cp /etc/zsh/zshrc /home/vagrant/.zshrc'
    - user: root
    - require:
      - pkg: zsh
      - cmd: zsh-config
