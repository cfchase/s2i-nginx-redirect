ENV_FILE := .env

ifneq ("$(wildcard $(ENV_FILE))","")
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})
endif

.DEFAULT_GOAL := build

.PHONY: login
login:
	./install/login.sh

.PHONY: build
build:
	./install/build.sh

.PHONY: push
push:
	./install/push.sh

.PHONY: deploy
deploy: login
	./install/deploy.sh

.PHONY: rollout
rollout: login
	./install/rollout.sh

.PHONY: undeploy
undeploy: login
	./install/undeploy.sh

