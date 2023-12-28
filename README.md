# toy-tcpip-go

An implementation of a small TCP/IP protocol protocol stack in Go

[![MIT license badge][mit-badge]][mit-url]
[![GitHub Actions workflow badge][github-actions-badge]][github-actions-url]

[mit-badge]: https://img.shields.io/badge/license-MIT-blue.svg
[mit-url]: https://github.com/nukopy/toy-tcpip/blob/main/LICENSE
[github-actions-badge]: https://github.com/nukopy/toy-tcpip-go/actions/workflows/ci.yml/badge.svg?branch=main
[github-actions-url]: https://github.com/nukopy/toy-tcpip-go/actions/workflows/ci.yml?query=branch:main

Toy TCP/IP protocol stack written in Go

This project is a Go implementation of a TCP/IP protocol stack written in C, [microps](https://github.com/pandax381/microps).

## Features

TODO

ref: https://github.com/pandax381/microps#features

## Environment

- Hardware
  - OS: macOS Sonoma 14.1
  - CPU: Apple M1 Max (arm64)
- Software
  - Go 1.21.5 darwin/arm64

## Run

### Format

```sh
make format
```

### Lint

```sh
make lint
```

### Run on Development

```sh
make run
```

### Run binary

```sh
make build
./bin/darwin-arm64/toy-tcpip-go
```

## References

- [github.com/pandax381/microps](https://github.com/pandax381/microps)
  - Implementation of TCP/IP protocol stack in C. This is a reference implementation of this project.
- [KLab Expert Camp 5](https://drive.google.com/drive/folders/1k2vymbC3vUk5CTJbay4LLEdZ9HemIpZe)
  - A series of lectures on TCP/IP protocol stack, [microps](https://github.com/pandax381/microps). This project is based on the contents of this lecture.

## License

toy-tcpip-go is licensed under the MIT License. For more details, check out [LICENSE](./LICENSE) file.
