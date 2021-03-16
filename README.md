# Valheim dedicated server

The source repository can be found in https://github.com/guilledipa/valheim

A CI pipeline is building https://hub.docker.com/r/guilledipa/valheim

## `/image`

This directory contains the `Dockerfile` to build a container for Valheim
dedicated server.

To build this image:

1. Install docker runtime
1. Build image

    ```shell 
    git clone https://github.com/guilledipa/valheim
    cd valheim/image
    docker build --tag guilledipa/valheim .
    ```

1. Run image

  ```shell
  docker run -e VALHEIM_SERVER_NAME -e VALHEIM_WORLD_NAME= -e VALHEIM_PASSWORD guilledipa/valheim
  ```

## `/k8s`

This is an opinionated `StatefulSet` configuration to run the public image in
https://hub.docker.com/r/guilledipa/valheim

Assumptions:

- GKE (although can easliy be adapted to other K8s providers)
  - Anthos Config Management – Config Sync

After installing Config Sync, create a `ConfigManagement` config.

Here a snippet:

```yaml
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

Assuming a default service account is being used for the cluster:

```shell
kubectl -n config-management-system annotate serviceaccount importer iam.gke.io/gcp-service-account=${PROJECT_ID}-compute@developer.gserviceaccount.com
```

## `/DM`

**TODO(guilledipa):** Add GCP Deployment manager configs