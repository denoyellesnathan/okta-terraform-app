# Define a default value for the environment variable
ENV ?= dev

apply:
	bash scripts/apply.sh $(ENV)
	
plan:
	bash scripts/plan.sh $(ENV)