GOCMD=scripts/go
GOLANGCI_LINT=scripts/golangci-lint

GOMODINIT=$(GOCMD) mod init
GOMODTIDY=$(GOCMD) mod tidy
GORUN=$(GOCMD) run .
GOBUILD=$(GOCMD) build .
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test -v --cover ./...
GOLINT=$(GOLANGCI_LINT) run

all: lint test run
init:
	@$(GOMODINIT)
tidy:
	@$(GOMODTIDY)
build:
	@GOOS=$(shell uname|tr '[A-Z]' '[a-z]') $(GOBUILD)
cover:
	@$(GOCOVER)
clean:
	@$(GOCLEAN)
run:
	@$(GORUN)
test:
	@$(GOTEST)
lint:
	@$(GOLINT)
