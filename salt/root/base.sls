vim:
  pkg:
    - installed

curl:
  pkg:
    - installed

zsh:
  pkg:
    - installed

zsh-config:
  cmd.run:
    - name: 'curl -s https://gist.github.com/b4stien/5875579/raw/e878d70eeb135a7eac2e124a14086fb19c94fd8f/zsh-config | sh'
    - cwd: /tmp
    - user: root
    - unless: cat /etc/zsh/dir_colors

python-pip:
  pkg:
    - installed
