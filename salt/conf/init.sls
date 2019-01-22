copy db config file:
  file.managed:
    - name: /etc/db.conf
    - source: salt://conf/db.conf