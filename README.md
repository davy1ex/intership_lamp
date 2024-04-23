# For build this docker:
### recomended structure:
├── apache-config
│   ├── l-a.time.test.conf
│   └── nsk.time.test.conf
├── dockerfile
└── src
    ├── la
    │   └── index.php
    └── nsk
        └── index.php



### for build and run:
```bash
docker build -t mylampapp .
docker run -d -p 80:80 mylampapp
```