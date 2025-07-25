#!/bin/bash

# Set hostname
sudo hostnamectl set-hostname mtc-${nodename}

# Install k3s server with external MySQL datastore
curl -sfL https://get.k3s.io | sh -s - server \
  --datastore-endpoint="mysql://${dbuser}:${dbpass}@tcp(${db_endpoint})/${dbname}" \
  --token="${token}" \
  --write-kubeconfig-mode=644

# Symlink for kubectl
sudo ln -sf /usr/local/bin/k3s /usr/local/bin/kubectl
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Wait for Kubernetes API to become available
echo "Waiting for k3s API to be ready..."
until kubectl get nodes &> /dev/null; do
  sleep 2
done

# Create deployment YAML
cat << EOF > /tmp/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
          hostPort: 8000
EOF

# Apply deployment
echo "Applying nginx deployment..."
kubectl apply -f /tmp/deployment.yaml
