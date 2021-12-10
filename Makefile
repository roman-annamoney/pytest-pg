all: deps lint test

deps:
	@python3 -m pip install --upgrade pip && pip3 install -r requirements-dev.txt

black:
	@black --line-length 120 pytest_pg

isort:
	@isort --line-length 120 --use-parentheses --multi-line 3 --combine-as --trailing-comma pytest_pg

flake8:
	@flake8 --max-line-length 120 --ignore C901,C812,E203 --extend-ignore W503 pytest_pg

lint: black isort flake8

pyenv:
	echo pytest_pg > .python-version && pyenv install -s 3.10.0 && pyenv virtualenv -f 3.10.0 pytest_pg
