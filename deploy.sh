docker build -t lucdang/rails-sample-api -f ./Dockerfile ./
docker push lucdang/rails-sample-api:latest

kubectl apply -f secret
kubectl apply -f auto_deploy_kubernetes
