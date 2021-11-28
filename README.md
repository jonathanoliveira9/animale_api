# README
### Animale API

## Overview

Animale is a plataform API to register animals forbidden.

## Requirements

The requirements to run this project include:
* ruby-3.0.1

## Instalation
```
Install Redis
$ sudo apt install redis-server

$ git clone https://github.com/jonathanoliveira9/animale_api.git

$ bundle install

$ rails db:create
$ rails db:migrate
$ rails s

To start sidekiq
$ bundle exec sidekiq

To run tests
$ bundle exec rspec spec
```


## Request API
Access to the API is granted by providing your account registered. You can use Postman. Example bellow.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://god.gw.postman.com/run-collection/6975213-53604b09-655c-4522-9af8-f95e1292efaf?action=collection%2Ffork&collection-url=entityId%3D6975213-53604b09-655c-4522-9af8-f95e1292efaf%26entityType%3Dcollection%26workspaceId%3Dacc675b8-d032-49bc-93ae-a3d5bb6827a6)

