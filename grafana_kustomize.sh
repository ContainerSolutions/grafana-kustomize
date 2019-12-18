#!/bin/bash


# Create a namespace for Grafana
kubectl apply -f grafana-charts/base/namespace.yml

# Template helm charts to kustomize resources
helm template --name grafana --output-dir grafana-charts/base --namespace grafana-kustomize --values grafana-charts/charts/grafana/values.yaml grafana-charts/charts/grafana

# Cleanup
rm -rf grafana-charts/base/grafana/tests

mv -f grafana-charts/base/grafana/templates/* grafana-charts/base/grafana

rm -rf grafana-charts/base/grafana/templates


# Apply the base and the Openshift overlay. It fixes two things: new admin creds and changes the fsGroup and user as Openshift uses different UIDs
kubectl apply -k grafana-charts/base/grafana

kubectl apply -k grafana-charts/overlays/openshift