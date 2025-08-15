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

.PHONY: setup-proxy
setup-proxy:
	docker network create proxy-manager

.PHONY: start-proxy
start-proxy:
	cd proxy-manager &&\
	docker compose up -d &&\
	cd ..

.PHONY: stop-proxy
stop-proxy:
	cd proxy-manager &&\
	docker compose down &&\
	cd ..	

.PHONY: full-start
full-start: start-proxy start

.PHONY: full-stop
full-stop: stop stop-proxy
