.PHONY: build
build:
	docker compose build

.PHONY: rebuild
rebuild:
	docker compose build --no-cache

.PHONY: start
start: build
	docker compose up -d

.PHONY: stop
stop:
	docker compose down

.PHONY: restart
restart: stop start
