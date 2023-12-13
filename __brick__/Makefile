.PHONY: default help update test integration_test
SHELL:=/bin/bash

COLOUR_GREEN=\033[0;32m
COLOUR_END=\033[0m

default: # run help command
	@make help

help: # show help
	@echo -e "Available commands:"

update: # update dependencies
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
