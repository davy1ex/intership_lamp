# For build this docker:
### recomended structure:
```
├── apache-config
│   ├── l-a.time.test.conf
│   └── nsk.time.test.conf
├── dockerfile
└── src
    ├── la
    │   └── index.php
    └── nsk
        └── index.php
```


### for run:
```bash
docker-compose up -d
```
### for stup:
```bash
docker-compose down 
```