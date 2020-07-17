
## Requirements

### install jinja2 command line j2
```bash
pip install j2cli[yaml]
```

### modify the yml file to add any additional users, details etc and execute
```
bash j2 Dockerfile.j2 Dockerfile.yml -o Dockerfile
```

### The usage is also available in the output Dockerfile
```bash
docker build --rm -t ubssh .
docker run --name ub01 -d -t ubssh
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ub01
ssh -l user1 ub01
```

