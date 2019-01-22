# Add users
{% for user, args in pillar.get('users', {}).iteritems() %}
normal {{user}}:
  user.present:
    - fullname: {{ args['fullname'] }}
    - home: /home/{{ usr }}


{{user}}_key:
  ssh_auth.present:
    - user: {{user}}
    - names: {{ key }}
{% endfor %}

#add sudo users
{% for user, args in pillar.get('sudousers', {}).iteritems() %}
sudo {{user}}:
  user.present:
    - fullname: {{ args['fullname'] }}
    - home: /home/{{ usr }}


sudo {{user}}_key:
  ssh_auth.present:
    - user: root
    - names: {{ key }}
{% endfor %}

#remove users
{% for user, args in pillar.get('removedusers', {}).iteritems() %}
remove {{user}}:
  user.absent: []


{{user}}_root_key:
  ssh_auth.absent:
    - user: root
    - names:
      - {{ key }}

{{user}}_key:
  ssh_auth.absent:
    - user: {{user}}
    - names:
      - {{ key }}
{% endfor %}