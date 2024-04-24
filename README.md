# For build this docker:
### recomended structure:
```
├── README.md
├── docker
│   └── php
│       ├── conf.d
│       │   └── xdebug.ini
│       └── dockerfile
├── docker-compose.yml
├── nginx-config
│   └── default.conf
└── src
    ├── index.html
    ├── index.php
    ├── la
    │   └── index.php
    ├── log_time.php
    └── nsk
        └── index.php
```


### for run:
```bash
docker-compose up -d --build
```
### for stup:
```bash
docker-compose down 
```