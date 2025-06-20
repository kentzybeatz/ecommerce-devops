#!/bin/bash

kubectl apply -f - <<MANIFEST
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello-app
  template:
    metadata:
      labels:
        app: hello-app
    spec:
      containers:
      - name: hello-app
        image: hashicorp/http-echo
        args:
        - "-text=Hello from EKS"
        ports:
        - containerPort: 5678
---
apiVersion: v1
kind: Service
metadata:
  name: hello-app
spec:
  selector:
    app: hello-app
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 5678
  type: ClusterIP
MANIFEST
