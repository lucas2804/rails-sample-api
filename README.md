## Rails Sample Restful

```
- Deploy by docker images to Kubernetes
- Deploy to Kubernetes with templates from **auto_deploy_kubernetes/api_ingress.json**
- Use Next.js/React.js/Redux for front end
- Use RoR for backend
- Use Mysql as DB
```


### II - Architecture design for high traffic Twitter

- Kubernetes combines over 15 years of Google’s experience running production workloads at scale with best-of-breed ideas and practices from the community. (https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
 
- Next.js is statically generated and server-rendered React applications

- React.js/Redux is the best way to maintain state of applications

- Mysql with indexing in retweets and tweets table can solve api response time under 1s

- If response time over 1s, consider to migrate separate table for separate retweets, or use other NoSQL

#### 1 - Turn on API server
- Environment variables are loaded from **.env.development**

```bash
git clone git@github.com:lucas2804/rails-sample-api.git
cd rails-sample-api
rake db:create
rake db:migrate
rake db:seed

rails s -b 0.0.0.0 -p 3001 # expose on http://localhost:30001
```

#### 2 - Turn on Next.js server for React.js-Frontend
- Environment variables are loaded from **.env.development**
- API_URL in development is equal **http:://localhost:30001** , which the same with api server.

```bash
git clone git@github.com:lucas2804/nextjs-sample.git
cd nextjs-sample

yarn install
yarn start

curl http://localhost:3000
```
