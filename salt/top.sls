base:
  'os_family:RedHat':
    - match: grain
    - java3
  'os_family:Debian':
    - match: grain
    - java2

  'roles:*db*':
    - match: grain
    - mysql

  'roles:*infra*':
    - match: grain
    - docker

  'roles:*public*':
    - match: grain
    - nginx
