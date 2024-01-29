SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@IFS=$$'\n' ; \
		help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
		for help_line in $${help_lines[@]}; do \
				IFS=$$'#' ; \
				help_split=($$help_line) ; \
				help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
				help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
				printf "%-30s %s\n" $$help_command $$help_info ; \
		done

.PHONY: build
build: ## Run docker build
	docker build -t nginx:local .

.PHONY: run
run: ## Run nginx
	docker run --name nginx --rm nginx:local

.PHONY: run-debug
run-debug: ## Run nginx with debug mode
	docker run --name nginx -p8080:8080 -p80:80 -p443:443 --rm nginx:local nginx-debug -g 'daemon off;'

