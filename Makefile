GO_CMD=scripts/go
GOLANGCI_LINT=scripts/golangci-lint

GO_DOCKER_BUILD=docker build . -t go

GO_MOD_INIT=$(GO_CMD) mod init
GO_MOD_TIDY=$(GO_CMD) mod tidy

GO_RUN=$(GO_CMD) run -race .
GO_BUILD=$(GO_CMD) build .
GO_CLEAN=$(GO_CMD) clean
GO_TEST=$(GO_CMD) test -race -v --cover ./...

GOLINT=$(GOLANGCI_LINT) run

all: lint test run
init:
	@$(GO_DOCKER_BUILD)
	@$(GO_MOD_INIT)
tidy:
	@$(GO_MOD_TIDY)
build:
	@CGO_ENABLED=0 GOOS=$(shell uname|tr '[A-Z]' '[a-z]') $(GO_BUILD)
clean:
	@$(GO_CLEAN)
run:
	@CGO_ENABLED=1 $(GO_RUN)
test:
	@CGO_ENABLED=1 $(GO_TEST)
lint:
	@$(GO_LINT)
