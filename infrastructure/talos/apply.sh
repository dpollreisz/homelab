#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.27.0.11 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n1.internal.pollreisz.dev.yaml
talosctl apply-config -n 10.27.0.12 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n2.internal.pollreisz.dev.yaml
talosctl apply-config -n 10.27.0.13 -f ./clusterconfig/dtmrh-k8s-001-dtmrh-u-dr420-n3.internal.pollreisz.dev.yaml
