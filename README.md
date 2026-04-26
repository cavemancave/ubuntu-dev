# ubuntu-dev

Ubuntu 22.04 dev container with sudo, vim, git, curl, wget, build-essential.

## Build

The `sources.list` file replaces `/etc/apt/sources.list` inside the image with the Tsinghua mirror (HTTP).
It is automatically copied during build via the `COPY sources.list /etc/apt/sources.list` instruction in the Dockerfile.

```bash
docker build -t ubuntu-dev .
```

## Rebuild & Restart

```bash
docker build -t ubuntu-dev . && docker stop dev && docker rm dev && docker run -d --name dev -v "C:\Users\taishan\localcode:/home/taishan/localcode" ubuntu-dev:latest
```

## Run

```bash
docker run -d --name dev -v "C:\Users\taishan\localcode:/home/taishan/localcode" ubuntu-dev:latest
```

## Enter the container

```bash
docker exec -it dev bash
```

## Stop / Remove

```bash
docker stop dev && docker rm dev
```

## Notes

- `C:\Users\taishan\localcode` is mounted to `/home/taishan/localcode` inside the container.
- Default user: `taishan` (password: `taishan`, passwordless sudo).
