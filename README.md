# HB Docker Environment

## Hightlights
* **Application:** http://localhost:8080 or https://localhost:4343
* **Adminer:** http://localhost:8081
* **Artisan:** `./artisan` equals `php artisan`. For example, `./artisan migrate`
* **Tinker:** `./tinker` runs *tinker*
* **Composer:** `./composer` runs  *composer*. For example `./composer dump-autoload`
* **Test:** `./artisan dusk` runs Laravel Dusk tests

## How to Install
### Requirements
* install docker from  https://docs.docker.com/docker-for-mac/install/ or `brew cask install docker`
* install npm https://nodejs.org/en/

### Installation
* clone environment `git clone git@bitbucket.org:hb/hb-docker.git hb-docker` and `cd hb-docker` in to it
* create directory for the certificates ```mkdir -p data/ssl```
* generate self-signed certificate
```
    openssl req -x509 -out localhost.crt -keyout localhost.key \
    -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' -extensions EXT -config <( \
    printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth") \
    -keyout data/ssl/localhost.key \
    -out data/ssl/localhost.crt 
```
* make macOS trust certificates `sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain data/ssl/localhost.crt`
* clone project `git clone git@bitbucket.org:hb/hb-www.git src`
* change permissions `sudo chmod -R 777 src/storage src/bootstrap/cache` *WARNING: For local development only*
* running up environment `docker-compose up -d`
* install composer packages `sh composer install`
* create .env file `cp src/.env.example src/.env`
* generate key `sh artisan key:generate`
* update .env file 
```
       DB_CONNECTION=pgsql
       DB_HOST=db
       DB_PORT=5432
       DB_DATABASE=forge2
       DB_USERNAME=forge
       DB_PASSWORD=secret

       REDIS_HOST=cache
```
* run migrations `sh artisan migrate`

## Using Vagrant's elasticsearch
* create tunnel to elastic: from vagrant directory run `ssh -L 9200:localhost:9200 vagrant@localhost -p 2222 -i .vagrant/machines/hb/virtualbox/private_key -fNg`
* in `.env` file replace elastic host with `ELASTICSEARCH_HOST=host.docker.internal`

## How to use
### Available commands
* up docker environment `docker-compose up -d`
* destroy environment `docker-compose down`
* stop containers `docker-compose stop`
* start containers `docker-compose start`

### Database
#### Connecting
You may use Adminer tool which already shipped with this environment or you may connect to db with favourite tool (PHPStorm, for example) using this settings:

* host: 127.0.0.1
* port: 5432
* db: forge2
* user: forge
* pass: secret

#### DB Dump
Warning: close DB client tools before

##### Local DB dump
###### Import
* copy `latest.db` in to `data/dump/latest.dump`
* run `./dump-import`
###### Export
* run `./dump-export`
* get dump from `data/dump/latest.dump`

#### Replicate Staging
* run `./replicate-staging`

### Update containers
* update repository `git pull`
* destroy current containers `docker-compose down`
* remove images `docker rmi -f hb-docker_app hb-docker_web`
* build and up `docker-compose up -d`