# Grafana deployed via kustomize

This repo is templating the community supported Helm charts into kustomize resources and applies them on a cluster.

By default, the Prometheus datasource is added and the Kubernetes app plugin is installed.

The overlays include configuration specific to Openshift and the its default Prometheus installation.

TODO
- Loading automatically dashboards
- Enabling automatically the plugin