.PHONY: default help update test integration_test
SHELL:=/bin/bash

COLOUR_GREEN=\033[0;32m
COLOUR_END=\033[0m

default: # run help command
	@make help

help: # show help
	@echo -e "Available commands:"
	@echo -e "${COLOUR_GREEN}make help${COLOUR_END}                - List of all commands"
	@echo -e "${COLOUR_GREEN}make update${COLOUR_END}              - Update dependencies"
	@echo -e "${COLOUR_GREEN}-----------------------------------------------------------${COLOUR_END}"
	@echo -e "${COLOUR_GREEN}make firebase_init${COLOUR_END}      - Init firebase project"
	@echo -e "${COLOUR_GREEN}make create_apps${COLOUR_END}        - Create firebase apps"
	@echo -e "${COLOUR_GREEN}make firebase_appdistribution${COLOUR_END} - Create firebase app distribution groups"


update: # update dependencies
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs


### -------------------------------------
###  FIREBASE
### -------------------------------------

firebase_init: # init firebase
	firebase login
	firebase project:create {{ projectName }} -n "{{ projectLabel }}" -o
	firebase use {{ projectName }}
	@make firebase_create_apps
    @make firebase_appdistribution

create_apps: # create firebase apps
	firebase apps:create iOS "{{ projectLabel }} DEV" -b cz.digital.{{appId}}.dev
	firebase apps:create iOS "{{ projectLabel }} TEST" -b cz.digital.{{appId}}.internal
	firebase apps:create iOS "{{ projectLabel }} STAGE" -b cz.digital.{{appId}}.stage

	firebase apps:create Android "{{ projectLabel }} DEV" -a cz.digital.{{appId}}.dev
	firebase apps:create Android "{{ projectLabel }} TEST" -a cz.digital.{{appId}}.internal
	firebase apps:create Android "{{ projectLabel }} STAGE" -a cz.digital.{{appId}}.stage

firebase_appdistribution:
	firebase appdistribution:group:create "Android" digital-android
	firebase appdistribution:group:create "iOS" digital-ios

	firebase appdistribution:testers:add --group-alias=digital-android jakub.robotka@digital.cz jan.kollert@digital.cz dsmobile.0009@gmail.com dsmobile.0010@gmail.com dsmobile.0100@gmail.com jitka.bolechova@digital.cz
	firebase appdistribution:testers:add --group-alias=digital-ios jakub.robotka@gmail.com jakub.robotka@digital.cz dsmobile.0007@gmail.com jitka.bolechova@digital.cz michal.rehak@digital.cz
