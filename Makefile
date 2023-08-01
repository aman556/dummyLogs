GO ?= $(shell command -v go 2> /dev/null)
GOPROXY := $(shell go env GOPROXY)
ifeq ($(GOPROXY),)
GOPROXY := https://proxy.golang.org
endif
export GOPROXY

GOPATH := $(shell go env GOPATH)

# Active module mode, as we use go modules to manage dependencies
export GO111MODULE=on

# Harbor registry
PROJECT := aman55/dummylogs

.PHONY: build
build: ## Build binary.
	$(GO) build -a -o ./bin/dummy-logs

.PHONY: run server
run-server: build ## Build and run server
	bin/dummy-logs

.PHONY: build server image & pushes to registry
build-push-image: # Build docker image for backend
	docker build --platform=linux/amd64 --no-cache --tag ${PROJECT}:latest . && docker push ${PROJECT}:latest
