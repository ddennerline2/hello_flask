#!/bin/sh
export DEPLOYMENT=hello-flask
(cat<<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $DEPLOYMENT
  labels:
    app: hello-flask
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-flask
  template:
    metadata:
      labels:
        app: hello-flask
    spec:
      containers:
      - name: hello-flask
        image: hello-flask:v6
        ports:
        - containerPort: 5000
EOF
) | kubectl apply -f -
kubectl expose deployment hello-flask --port=5000 --type=LoadBalancer

