# II - Rails Sample Restful

- Current production url: **http://34.96.252.51**

### I - Tech stack

- CI-CD by Travis which includes (.travis.yml): 
    + run automation tests of rails-sample-api
    + run rake db:setup; rake db:migrate; rspec
    + cache rvm, cache docker images, cache google cloud
    + build, tag, push docker image by $SHA to make sure k8s can always update new image and RollingUpdate with zero downtime
        + docker build -t lucdang/rails-sample-api:$SHA -f ./Dockerfile ./
        + kubectl set image deployments/rails-sample-api rails-sample-api=lucdang/rails-sample-api:$SHA
    + Grant access permission from Travis-CI to cluster by service-account-IAM
    + Deploy to Google Cloud K8s cluster
    + `kubectl set image` to make sure update new image instead of use `latest` tag

- `kubectl apply -f secret` in `deploy.sh` to create configmap and secret 
- `kubectl -f auto_deploy_kubernetes` in `deploy.sh` to create ingresses, services, deployments...
- All secrets are created under base64 encode files BUT:
    + create secret manually is better solution for security purpose
    + User vault service is a good approach to store sensitive data
- Use RoR for api server
- Use Mysql as DB

### II - BONUS: how you would handle zero-downtime upgrades of the service

- **`I've already implemented zero downtime`** on deployment `rails-sample-api`
- Use terms: strategy, maxSurge, maxUnavailable, RollingUpdate, readinessProbe, preStop

- Explain how it work:
    + maxUnavailable=50%: specifies the maximum number of Pods that can be unavailable during the update process. 
    + maxSurge=50%: specifies the maximum number of Pods that can be created 
    + RollingUpdate: The deployment update pod by pod depends on maxUnavailable, maxSurge instead of kill all which lead to downtime
    + readinessProbe: to make sure the server is actually ready to receive requests (fill in spec.containers)
    + preStop-sleep 15s: waiting for a while before send shutdown signal to make sure load balancer stop send request.

```json
{
  "kind": "Deployment",
  "spec": {
    "replicas": 2,
    "selector": {
      "matchLabels": {
        "app": "rails-sample-api"
      }
    },
    "strategy": {
      "rollingUpdate": {
        "maxSurge": "50%",
        "maxUnavailable": "50%"
      },
      "type": "RollingUpdate"
    },
    "template": {
      "spec": {
        "containers": [
          {
            "args": [
              "bundle",
              "exec",
              "rails",
              "s",
              "-b",
              "0.0.0.0",
              "puma"
            ],
            "name": "rails-sample-api",
            "image": "lucdang/rails-sample-api",
            "readinessProbe": {
              "httpGet": {
                "path": "/healthz",
                "port": 3000
              },
              "initialDelaySeconds": 5,
              "periodSeconds": 5,
              "successThreshold": 1
            },
            "lifecycle": {
              "preStop": {
                "exec": {
                  "command": [
                    "/bin/bash",
                    "-c",
                    "sleep 15"
                  ]
                }
              }
            },
            "ports": [
              {
                "containerPort": 3000
              }
            ],
            "envFrom": [
              {
                "configMapRef": {
                  "name": "rails-config-map"
                }
              },
              {
                "secretRef": {
                  "name": "rails-secret"
                }
              }
            ],
            "imagePullPolicy": "Always"
          }
        ],
        "restartPolicy": "Always",
        "imagePullSecrets": [
          {
            "name": "lucdang-regcred"
          }
        ]
      },
      "metadata": {
        "name": "service-sptel-api",
        "labels": {
          "app": "rails-sample-api"
        },
        "namespace": "default"
      }
    }
  },
  "metadata": {
    "name": "rails-sample-api",
    "labels": {
      "app": "rails-sample-api"
    },
    "namespace": "default"
  },
  "apiVersion": "apps/v1"
}
```

### III - Simple Ruby Server

- I've implemented by Ruby because I'm not familiar with Python or Go, I can learn them fast but cant learn in 1 day.
- In the content_html response, I've redact author names to `***` then response data.

![gcloud-cmd.png](./images/gcloud-cmd.png)
![travis-ci.png](./images/travis-ci.png)
![travis-ci.png](./images/travis-ci-01.png)
![travis-ci.png](./images/travis-ci-02.png)

![json_response.png](./images/json_response.png)
