# Define a default value for the environment variable
ENV ?= dev

destroy:
	bash scripts/destroy.sh $(ENV)

apply:
	bash scripts/apply.sh $(ENV)

plan:
	bash scripts/plan.sh $(ENV)