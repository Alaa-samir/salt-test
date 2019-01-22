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
    - names: {{ args['ssh-keys']}}
{% endfor %}

#add sudo users
{% for user, args in pillar.get('sudousers', {}).iteritems() %}
sudo {{user}}:
  user.present:
    - name: {{ user }}
    - fullname: {{ args['fullname'] }}
    - home: /home/{{ user }}


sudo {{user}}_key:
  ssh_auth.present:
    - user: root
    - names: {{ args['ssh-keys']}}
{% endfor %}

#remove users
{% for user, args in pillar.get('removedusers', {}).iteritems() %}
remove {{user}}:
  user.absent: []


{{user}}_root_key:
  ssh_auth.absent:
    - user: root
    - names: {{ args['ssh-keys']}}

{{user}}_key:
  ssh_auth.absent:
    - user: {{user}}
    - names: {{ args['ssh-keys']}}
{% endfor %}