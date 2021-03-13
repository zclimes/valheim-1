# Valheim

Valheim dedicated server

Assumptions:

- GKE
  - ACM

Here a snippet for your `ConfigManagement` config:

```
apiVErsion: configmanagement.gke.io/v1
kind: ConfigManagement
metadata: config-management
spec:
  clusterName: <Your Cluster Name>
  git:
    syncRepo: https://github.com/guilledipa/valeim.git
    syncBranch: main
    secretTupe: none
    policyDir: /k8s
```