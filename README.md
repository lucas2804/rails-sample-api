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

- Use terms: strategy, maxSurge, maxUnavailable, RollingUpdate, readinessProbe, preStop
- I've already implemented zero downtime on deployment `rails-sample-api`
- Explain how it work:
    + maxUnavailable=50%: specifies the maximum number of Pods that can be unavailable during the update process. 
    + maxSurge=50%: specifies the maximum number of Pods that can be created 
    + RollingUpdate: The deployment update pod by pod depends on maxUnavailable, maxSurge instead of kill all which lead to downtime
    
