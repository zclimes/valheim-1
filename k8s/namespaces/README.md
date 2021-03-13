# Anthos Configuration Management Directory

[documentation](https://cloud.google.com/anthos-config-management/docs/repo)

The `namespaces/` directory contains configs for namespaces and namespace-scoped
objects. The structure within `namespaces/` is the mechanism that drives
namespace inheritance. You can limit which namespaces can inherit a config, 
by using a `NamespaceSelector`.