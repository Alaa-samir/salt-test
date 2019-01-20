base:
  '*' :
    - java

  'roles:*db*':
    - match: grain
    - mysql

  'roles:*infra*':
    - match: grain
    - docker

  'roles:*public*':
    - match: grain
    - nginx

