# OpenJobs

## Build Status

[![Build Status](https://semaphoreci.com/api/v1/duduribeiro/opensanca_jobs/branches/master/badge.svg)](https://semaphoreci.com/duduribeiro/opensanca_jobs)

## Get Started

```
$ git clone https://github.com/opensanca/opensanca_jobs.git
$ cd opensanca_jobs
```

### Environment

Your environment variables goes here in `.env`

```
# cp .env.sample .env
```

You can run OpenJobs locally by two ways. 
- Local classic development.
- Local Docker development.

### Local Development

#### Dependencies

##### Ruby

The application uses Ruby 2.5.0. You should install it to run the application. (for development we recommend to use [RVM](https://rvm.io/))

##### Postgres

We use PostgreSQL as database. You should install it to run the app.
If needed, you should configure the `config/database.yml` file.

> Tip - If you don't like boring installations. Try Docker containers.
>
> You can use Docker to easy database setup.
> ```bash
> $ docker run --name postgres_open_jobs \
>   -e POSTGRES_PASSWORD=postgres \
>   -e POSTGRES_DB=opensanca_jobs_development \
>   -e POSTGRES_USER=postgres \
>   -p 5432:5432 -d postgres:9.6.5
> ```

##### Redis

We use [Redis](https://redis.io/) for asynchronous jobs.

> Tip - Try Docker containers.
>
> You can use Docker to startup Redis.
> ```bash
> $ docker run --name redis -p 6379:6379 -d redis
> ``` 


##### Mail server

For local development, we suggest to use Mailhog (https://github.com/mailhog/MailHog) or Mailcatcher (https://mailcatcher.me/)

#### Configuring the project

Install the dependencies and configure the database

```
$ bin/setup
```

Run the tests
```
$ rspec .
```

Start the app:

```
$ bin/rails s
```

### Docker Development

#### Dependencies

##### Docker

+ [Docker](https://docs.docker.com/install/)
+ [Docker Compose](https://docs.docker.com/compose/install/)

#### Configuring the project

Starting containers

```
$ docker-compose up
```

Configure database schemas and migrations

```
$ docker-compose run --rm web bin/setup
```

## Done

Navigate to http://localhost:3000 to access
