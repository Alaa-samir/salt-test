base:
  'os_family:RedHat':
    - match: grain
    - default-redhat
  'os_family:Debian':
    - match: grain
    - default-debian