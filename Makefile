help:
	@echo Developer commands for django_render_react
	@echo
	@grep -E '^[ .a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

test: ## Run the test suite with some defaults
	pytest -vv -x

coverage: test ## Generate a code coverage report and view it
	python -m webbrowser -t htmlcov/index.html

mypy: ## Run a static syntax check
	mypya

lint:  ## autoformats the codebase to match Black styling.
	black .

clear-caches:  ## Clean various cache files
	rm -rf .mypy_cache
	rm -rf .pytest_cache
	rm -rf htmlcov


.PHONY: coverage test lint clear-caches
