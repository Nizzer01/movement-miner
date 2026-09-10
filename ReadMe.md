# Movement Miner — Microservice Architecture

Movement Miner is a distributed, event‑driven microservice system built in Go.  
It ingests raw movement data, processes feature vectors, performs probabilistic
movement prediction, and stores trajectory results for UI consumption.

---

## Architecture Overview

The system follows a microservice pattern with independently deployable Go modules:

- **Ingestion Service** — receives raw movement data and publishes events.
- **Feature Service** — transforms raw data into feature vectors.
- **Model Service** — performs Naive Bayes prediction and anomaly scoring.
- **Trajectory Service** — stores predictions in Postgres/PostGIS.
- **Gateway Service** — public API for UI and external clients.
- **React UI** — visualisation and interaction layer.

Each service is independently deployable, versioned, and containerised.

---

## Repository Structure

```
movement-miner/
  services/
    ingestion/
    features/
    model/
    trajectory/
    gateway/
  ui/
    react-app/
  deploy/
    k8s/
    terraform/
```

Each service contains its own `go.mod`, `main.go`, Dockerfile, and internal packages.

---

## Running Locally

You can run any service independently:

```
cd services/ingestion
go run .
```

Or run multiple services in parallel using separate terminals.

---

## Building Docker Images

```
cd services/model
docker build -t model-service .
```

---

## Kubernetes Deployment

Kubernetes manifests are located in:

```
deploy/k8s/
```

Apply them to a local cluster (kind/k3d):

```
kubectl apply -f deploy/k8s
```

---

## Message Broker

The system is designed for event-driven communication using Kafka or NATS:

- `movement.raw`
- `movement.features`
- `movement.prediction`

These topics form the backbone of the ingestion → features → model → storage pipeline.

---

## Status

This repository currently contains scaffolding for all microservices.  
Implementation will proceed service-by-service.

---

## License

MIT

---
## Make file cmds 
make run-ingestion
make run-model
make run-gateway

