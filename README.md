# ACRAR - ACRA on Rails

Rails backend for [ACRA](https://code.google.com/p/acra/)

## Contents

* [Overview](#overview)
* [Dependencies](#dependencies)
* [Development Setup](#setup)
* [Deploying to Heroku](#deployment)
* [API Documentation]
* [Config Vars]

<a name="overview"></a>
## Overview

This is a Rails backend for [ACRA](https://code.google.com/p/acra).

<a name="dependencies"></a>
## Dependencies

* See the Gemfile
* Ruby 1.9.3
* Rails 3.2.8
* PostgreSQL

<a name="setup"></a>
## Setup

### Grab the Source

1. [Fork the repo](https://github.com/livefront/acrar/fork_select)

2. Checkout the source

        $ git clone git@github.com:<your_account>/acrar.git
        $ cd acrar
        $ git checkout -t origin/stable
        $ git checkout master

### App Setup

1. Install dependencies:

        $ bundle install

2. Set up the database:

        $ rake db:create
        $ rake db:migrate
        $ rake db:test:load

3. Load demo data:

        $ rake db:seed
        $ rake app:load_demo_data

    (When necessary, you can delete the demo data with `rake app:destroy_demo_data`.)

4. Run unit tests:

        $ rspec

4. Fire it up:

        $ foreman start

    [Foreman](https://github.com/ddollar/foreman) is used because of its ability to easily set environment variables with the `.env` file. 

<a name="deployment"></a>
## Deploying to Heroku

### One-time setup

1. Create the app

        $ heroku create --stack cedar

2. Set Heroku config variables

        $ heroku config:add EMAIL_RECIPIENTS=...

### Deployment

    $ git push heroku master
    $ heroku run rake db:migrate
    $ heroku ps:restart
