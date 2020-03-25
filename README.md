# Rails Sample Restful
[![pipeline status](https://gitlab.skylabteam.com/innogram.sg/rails-sample-api/badges/master/pipeline.svg)](https://gitlab.skylabteam.com/innogram.sg/rails-sample-api/commits/master)
[![coverage report](https://gitlab.skylabteam.com/innogram.sg/rails-sample-api/badges/test/coverage.svg)](https://gitlab.skylabteam.com/innogram.sg/rails-sample-api/commits/master)

### Fork to a new repo

### Configuration

### Install Overcommit

> bundle install

> overcommit --install

### Running
> rails s

### Unit Test

> RAILS_ENV=test bundle exec rspec

### Clean
> ./clean.sh

### User APIs

#### List

```
curl -X GET \
  http://localhost:3000/users \
  -H 'cache-control: no-cache'
```

#### Get

```
curl -X GET \
  http://localhost:3000/users/1 \
  -H 'cache-control: no-cache'
```

#### Create

```
curl -X POST \
  http://localhost:3000/users \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "user": {
        "email": "admin@example.com",
        "password": "abc!@#"
    }
}'
```

#### Update

```
curl -X PUT \
  http://localhost:3000/users/1 \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "user": {
        "email": "admin@example.com",
        "password": "abc!@#1"
    }
}'
```

#### Delete

```
curl -X DELETE \
  http://localhost:3000/users/1 \
  -H 'cache-control: no-cache'
```
