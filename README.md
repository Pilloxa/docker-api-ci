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

## To publish

1. Launch Docker Desktop app
2. Login with appropriate user
3. Go to images
4. Select image version and select "Push to Hub" option from "Actions" tab
