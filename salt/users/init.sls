# Add users
{% for user, args in pillar.get('users', {}).iteritems() %}
normal {{user}}:
  user.present:
    - name: {{ user }}
    - fullname: {{ args['fullname'] }}
    - home: /home/{{ user }}


{{user}}_key:
  ssh_auth.present:
    - user: {{user}}
    - name: {{ args['ssh-keys']}}
{% endfor %}

#add sudo users
{% for user, args in pillar.get('sudousers', {}).iteritems() %}
sudo {{user}}:
  user.present:
    - name: {{ user }}
    - fullname: {{ args['fullname'] }}
    - home: /home/{{ user }}
    - groups:
        - sudo

sudo {{user}}_key:
  ssh_auth.present:
    - user: {{ user }}
    - name: {{ args['ssh-keys']}}
{% endfor %}

#remove users
{% for user, args in pillar.get('removedusers', {}).iteritems() %}
remove {{user}}:
  user.absent: []


{{user}}_root_key:
  ssh_auth.absent:
    - user: root
    - name: {{ args['ssh-keys']}}

{{user}}_key:
  ssh_auth.absent:
    - user: {{user}}
    - name: {{ args['ssh-keys']}}
{% endfor %}

/etc/sudoers.d/sudonopasswd:
  file.managed:
    - source: salt://users/files/sudoers.d/sudonopasswd
    - user: root
    - mode: 440