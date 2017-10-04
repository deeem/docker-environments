# Laravel docker

## Installation

* `make laravel` - installs Laravel
* `make up` - build docker container
* `cp laravel/.env.example laravel/.env`
* `sh artisan key:generate`
* `sudo chmod -R 777 laravel/storage laravel/bootstrap/cache` - fix permission problem.  **WARNING: For local development only**  Security risk

Db connection in `.env` file:
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=app
DB_USERNAME=root
DB_PASSWORD=secret
```

## Usage

* **Application:** `http://127.0.0.1:8080`
* **PHPMyAdmin:** `http://127.0.0.1:8081`
* **Artisan:** `sh artisan` equals `php artisan`. _For example, `sh artisan migrate`_

### Logs

`make logs` - show logs (Ctr+C to exit)
