
.PHONY: help \
artisan-key \
composer-install config \
install npm-install npm-run-dev \
npm-watch shell tinker uninstall \
up upd stop

.DEFAULT_GOAL := help

PHP_CONTAINER := sb-learning-task-php-1
NODE_CONTAINER := node:latest
NODE_VITE_PORT := 5173:5173

# Set dir of Makefile to a variable to use later
MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))

USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)

NODE := docker run -p $(NODE_VITE_PORT) -it -v $(PWD)/src:/usr/src/app -w /usr/src/app --rm node:latest

help: ## * Show help (Default task)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

composer-install: ## Setup step #2: Run composer install
	docker exec -it $(PHP_CONTAINER) composer install

artisan-key: ## Setup step #3: Run composer install
	docker exec -it $(PHP_CONTAINER) php artisan key:generate

npm-install: ## Setup step #4: Run npm install
	$(NODE) npm install

npm-dev: ## Setup step #5: Run npm run dev
	$(NODE) npm run dev

npm-build: ## Run npm run build
	$(NODE) npm run build

install: composer-install artisan-key npm-install npm-build  ## Run the setup steps automatically

uninstall: ## Cleanup project by removing .env, PHP packages, node modules, files under the storage directory, etc.
	rm -f .env
	rm -f storage/logs/*.log
	rm -f storage/app/public/*
	rm -rf storage/framework/cache/data/*
	rm -rf vendor
	rm -rf node_modules
	rm -rf coverage
	rm -rf resources/json/*

shell: ## Open bash as host user in the PHP container
	docker exec -u $(USER_ID):$(GROUP_ID) -it $(PHP_CONTAINER) bash

shell-root: ## Open bash as root in the PHP container
	docker exec -it $(PHP_CONTAINER) bash

build: ## App build
	docker-compose up -d --build

up: ## Run docker-compose up
	docker-compose up

upd: ## Run docker-compose up with -d
	docker-compose up -d

start: ## Start docker containers
	docker-compose start

stop: ## Stop docker containers
	docker-compose stop
