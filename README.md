# URL Shortener API

This application provides API endpoints to create and retrieve shortened URLs. It also redirects the shortened URL to the original one.
The API docs are available on `localhost:3000/api-docs` once the application is running.

### Getting started

Follow the steps below to get the development environment up and running

Clone the project
```
git@github.com:betogrun/url-shortener-api.git && cd url-shortener-api
```

Create the database and run the migrations

```
docker-compose run --rm web bundle exec rails db:create
```

### Running
```
docker-compose up
```

## Running the tests
```
docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec
```

## Generating the API documentation
```
dockeer-compose run --rm bundle exec rails rswag:specs:swaggerize
```

## Debugging

Get the web container id

```
docker ps
```

Attach your terminal to the container

```
docker attach container_id
```
