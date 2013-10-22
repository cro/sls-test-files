base:
    'role:webserver':
      - match: grain
      - webserver

    'role:database':
      - match: grain
      - database

