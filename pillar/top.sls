base:
  'os_family:RedHat':
    - match: grain
    - default-redhat
  'os_family:Debian':
    - match: grain
    - default-debian

  'roles:dev':
    - match: grain
    - dev-confg
  'roles:stage':
    - match: grain
    - stage-confg
  'roles:prod':
    - match: grain
    - prod-confg