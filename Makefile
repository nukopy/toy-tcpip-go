.DEFAULT_GOAL := help

# --------------------------------------------------
# commands for Go
# --------------------------------------------------

GO111MODULE = on
GOARCH = arm64
GOOS = darwin
CGO_ENABLED = 0
BIN_DIR = bin/$(GOOS)-$(GOARCH)
BIN_NAME = toy-tcpip-go

.PHONY: format, format-no-overwrite, lint, lintv, test, test-with-coverage, before-push, build
format: ## run format code with gofmt
	gofmt -l -w .

format-no-overwrite: ## check if code is formatted (when code is not formatted, exit 1)
	test -z $(shell gofmt -l .) || (echo "Code is not formatted with gofmt:" && gofmt -d . && exit 1)

lint: ## run lint (settings in .golangci.yml)
	golangci-lint run

lintv: ## run lint verbosely
	golangci-lint run -v

test: ## run test
	go test -v ./... -race -count=1

test-with-coverage: ## run test with coverage for Codecov
	go test -v ./... -race -count=1 -covermode=atomic -coverprofile=profile.out

before-push: ## run before push
	make format
	make lint
	make test

build: ## build binary
	rm -rf $(BIN_DIR)
	GO111MODULE=$(GO111MODULE) GOARCH=$(GOARCH) GOOS=$(GOOS) CGO_ENABLED=$(CGO_ENABLED) go build -o $(BIN_DIR)/$(BIN_NAME) ./main.go

run: ## run binary
	go run .

# --------------------------------------------------
# other commands
# --------------------------------------------------

.PHONY: help
help:
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
