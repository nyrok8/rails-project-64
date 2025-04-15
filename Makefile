.PHONY: install lint test

install:
	bundle install

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views

test:
	bundle exec rake test