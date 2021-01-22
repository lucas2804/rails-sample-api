###
- git clone https://github.com/brikis98/terraform-up-and-running-code.git


## I) SkyLab Exp

- 1) Key of product
    + Offer Infra as a service (IaaS), Software as a service (SaaS)
        (
        Hints: 
            + We have a lot of server in Singapore, so we create outer cluster k8s, and offer some small kubernetes for customers which inside inner cluster
            + Then we deploy services, applications, into them via api call to master node which relate to 5G platform, face_recognize, AI, admin_page...
            + To routing to the services, we use kong gateway api
            + Power DNS
            + Database cluster
            + Migrate database
            + Migrate Kong gateway API
            + Migrate vault services for sensitive data
            + Deploy services, ingresses...
            + Deploy certificates via ingresses for SSL purpose
        )
    
    + K8s scalability https://kubernetes.io/blog/2017/03/scalability-updates-in-kubernetes-1-6/
    
    + 5,000-node clusters with up to 150,000 pods. (v1.6)
    + 2,000-node cluster in v1.3  
    + K8s best practices
        + Running in multiple zones, replication controller spreading behavior is extended across zones 
