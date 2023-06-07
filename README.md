# Docker image for Pilloxa CI

## To release

Commit all changes then

```
script/release
```

## To build

```
docker build -t pilloxa/docker-api-ci:VERSION .
```
Replace VERSION with the corresponding version of the github tag
