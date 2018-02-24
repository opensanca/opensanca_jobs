# OpenJobs

## Build Status

[![Build Status](https://semaphoreci.com/api/v1/duduribeiro/opensanca_jobs/branches/master/badge.svg)](https://semaphoreci.com/duduribeiro/opensanca_jobs)

## README

### Dependencies

#### Ruby Version
The application uses Ruby 2.5.0. You should install it to run the application. (for development we recommend to use [RVM](https://rvm.io/))

#### Database

We use PostgreSQL as database. You should install it to run the app.
If needed, you should configure the `config/database.yml` file.

### Configuring the project

Clone it

```
git clone https://github.com/opensanca/opensanca_jobs.git
cd opensanca_jobs
```

Install the dependencies and configure the database

```
bin/setup
```

Run the tests
```
rspec .
```

Start the app:

```
bin/rails s
```

Navigate to http://localhost:3000 to access
