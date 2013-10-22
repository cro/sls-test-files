/var/lib/postgres/data:
  file.directory:
    - user: postgres
    - group: postgres
    - mode: 755
    - makedirs: true
    - recurse:
      - user
      - group
      - mode

pgdb-init:
    cmd.run:
      - cwd: /var/lib/postgres/data
      - user: postgres
      - name: /usr/bin/initdb --pgdata /var/lib/postgres/data -E UTF8 --locale=en_US.utf-8
      - unless: '[ "$(ls -A /var/lib/postgres/data)" ]'
      - require: 
        - file: /var/lib/postgres/data

postgresql:
  pkg:
    - installed
  require:
    - pgdb-init
  service:
    - running
    - enable: True
