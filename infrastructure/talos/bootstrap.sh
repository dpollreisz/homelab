#!/usr/bin/env bash

echo "Applying Node Configs"
# Deploy the configuration to the nodes
talosctl apply-config --insecure -n 10.27.0.21 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n1.internal.pollreisz.me.yaml
talosctl apply-config --insecure -n 10.27.0.22 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n2.internal.pollreisz.me.yaml
talosctl apply-config --insecure -n 10.27.0.23 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n3.internal.pollreisz.me.yaml

echo "Sleeping..."
sleep 120

talosctl config node "10.27.0.11"; talosctl config endpoint 10.27.0.11 10.27.0.12 10.27.0.13 10.27.0.10
echo "Running bootstrap..."
talosctl bootstrap

echo "Sleeping..."
sleep 180

talosctl kubeconfig -f .
export KUBECONFIG=$(pwd)/kubeconfig

echo kubectl get nodes
kubectl get nodes

# ./deploy-integrations.sh
