docker build -t lucdang/rails-sample-api:$SHA -f ./Dockerfile ./
docker push lucdang/rails-sample-api:$SHA

kubectl apply -f secret
kubectl apply -f auto_deploy_kubernetes
kubectl set image deployments/rails-sample-api rails-sample-api=lucdang/rails-sample-api:$SHA
