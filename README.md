# ubuntu-dev

Ubuntu 22.04 dev container with sudo, vim, git, curl, wget, build-essential, gdb, llvm, clang, clangd, cmake, openssh-server.

## Build

The `sources.list` file replaces `/etc/apt/sources.list` inside the image with the Tsinghua mirror (HTTP).
It is automatically copied during build via the `COPY sources.list /etc/apt/sources.list` instruction in the Dockerfile.

```bash
docker build -t ubuntu-dev .
```

## Run (Linux)

```bash
docker run -d --name dev \
  -v ~/code:/home/taishan/workspace/code \
  -p 2222-2252:22 \
  ubuntu-dev:latest
```

## Run (Windows)

```bash
docker run -d --name dev -v "C:\Users\taishan\localcode:/home/taishan/workspace/code" -p 2222-2252:22 ubuntu-dev:latest
```

## Rebuild & Restart (Linux)

```bash
docker build -t ubuntu-dev . && docker stop dev && docker rm dev && docker run -d --name dev -v ~/code:/home/taishan/workspace/code -p 2222-2252:22 ubuntu-dev:latest
```

## Enter the container

```bash
docker exec -it dev bash
```

## SSH

```bash
ssh -p 2222 taishan@localhost
```

Docker picks the first available port in 2222-2252 if 2222 is already in use.

## Stop / Remove

```bash
docker stop dev && docker rm dev
```

## Notes

- Default user: `taishan` (password: `taishan`, passwordless sudo).
- SSH server runs on port 22 inside the container.
