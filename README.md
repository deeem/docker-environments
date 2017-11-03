# Laravel docker

## Installation

### New app

* `make laravel` - installs Laravel
* `make up` - build docker container
* `cp laravel/.env.example laravel/.env`
* `sh artisan key:generate`
* `sudo chmod -R 777 laravel/storage laravel/bootstrap/cache` - fix permission problem.  **WARNING: For local development only**  Security risk

Db connection in `.env` file if needed:
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=app
DB_USERNAME=root
DB_PASSWORD=secret
```

### Import app

* `git clone project_url laravel` - clone existing project in to laravel dir
* `cp laravel/.env.example laravel/.env`
* `sudo chmod -R 777 laravel/storage laravel/bootstrap/cache` - fix permission problem.  **WARNING: For local development only**  Security risk
* `make up` - build docker container
* `make install` - install laravel and other depedencies from composer.json
* `sh artisan key:generate`
* copy DB parameters to `.env`
* seed tables

## Usage

* **Application:** `http://127.0.0.1:8080`
* **PHPMyAdmin:** `http://127.0.0.1:8081`
* **Artisan:** `sh artisan` equals `php artisan`. _For example, `sh artisan migrate`_
* **Tinker:** `make tinker`

### Logs

`make logs` - show logs (Ctr+C to exit)
