zsh-set:
  cmd.run:
    - name: 'chsh -s /bin/zsh admin && cp /etc/zsh/zshrc /home/admin/.zshrc'
    - user: root
    - require:
      - pkg: zsh
      - cmd: zsh-config

virtualenvwrapper-set:
  cmd.run:
    - name: cat /etc/zsh/virtualenvwrapper >> /home/admin/.zshrc && touch /root/virtualenvwrapper_done
    - user: root
    - unless: cat /root/virtualenvwrapper_done
    - require:
      - cmd: zsh-set
      - file: /etc/zsh/virtualenvwrapper
