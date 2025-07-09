.PHONY: build
build:
	docker compose build

.PHONY: start
start: build
	docker compose up -d

.PHONY: stop
stop:
	docker compose down
