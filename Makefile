# Root Makefile for Movement Miner

SERVICES = ingestion features model trajectory gateway

run-%:
	cd services/$* && go run .

build-%:
	cd services/$* && go build -o ../../bin/$*

docker-%:
	cd services/$* && docker build -t movement-miner-$* .

run-all:
	for svc in $(SERVICES); do \
        (cd services/$$svc && go run . &) ; \
    done

build-all:
	for svc in $(SERVICES); do \
        (cd services/$$svc && go build -o ../../bin/$$svc) ; \
    done

docker-all:
	for svc in $(SERVICES); do \
        (cd services/$$svc && docker build -t movement-miner-$$svc .) ; \
    done
