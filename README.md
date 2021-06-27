# Personal Resume Site

Build this locally with the following command:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t danielmanners/resume-dot-danmanners-dot-com --push .
```

This will build the container for both `x64` and `ARM64` architecture systems and push it to dockerhub.
