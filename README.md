# Money App
## Specs
* /money-api - Server Side Application

### Technologies
* Java 8
* Spring Framework _(Boot, Data, Security, Oauth, DevTools, Web)_
* Mysql
* Flyway Db Migrator
* Jackson
* Apache Commons

#### How to use

##### Postman tests
 1. Get client **oauth-tokken** with _basic authentication_.
``` POST: localhost:8080/oauth/token
Authorization Type : Basic Oauth
user: angular
password: @ngul@r

BODY > x-www-form-urlencoded

client: angular
username: admin
password: admin
grant_type > password
```
2. Send in new requests with **HEADER Key** _"Authorization"_ with bearer token ("bearer xxxxxnnnnxxxnnnxxx-xnxnnx-")