# README
### Animale API

## Overview

Animale is a plataform API to register animals forbidden.

## Authentication
Access to the API is granted by providing your account registered. Example bellow.

```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678", "password_confirmation": "12345678", "name": "Jonathan" } }' http://localhost:3000/users
```
