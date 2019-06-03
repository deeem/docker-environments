# Laravel docker

## Installation

### New app

* install laravel `docker run --rm -v `pwd`:/app -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro --user=`id -u` composer create-project --prefer-dist laravel/laravel /app/src`
* start docker `docker-compose up -d`
* `cp src/.env.example src/.env`
* `sh artisan key:generate`
* `sudo chmod -R 777 src/storage src/bootstrap/cache` - fix permission problem.  **WARNING: For local development only**  Security risk

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

* `git clone project_url src` - clone existing project in to laravel dir
* `cp src/.env.example src/.env`
* `sudo chmod -R 777 src/storage src/bootstrap/cache` - fix permission problem.  **WARNING: For local development only**  Security risk
* start docker `docker-compose up -d`
* `sh composer install` - install laravel and other depedencies from composer.json
* `sh artisan key:generate`
* `cp .editorconfig src/.editorconfig`
* copy DB parameters to `.env`
* seed tables

## Usage

* **Application:** `http://127.0.0.1:8080`
* **PHPMyAdmin:** `http://127.0.0.1:8081`
* **Artisan:** `sh artisan` equals `php artisan`. For example, `sh artisan migrate`
* **Tinker:** `sh tinker` runs tinker
* **Composer:** `sh composer` runs composer
* **Logs** `docker-compose logs --follow`

## Testing

`sh phpunit` - runs phpunit, can accept additional parameters (`sh phpunit --filter SomeTest`)

### Web app url

**.env**

```
APP_URL=http://web
```

### In memory sqlite db testing

**phpunit.xml**

```
<env name="DB_CONNECTION" value="sqlite"/>
<env name="DB_DATABASE" value=":memory:"/>
```

### Dusk
#### Install

Get Dusk
`composer require --dev laravel/dusk`

Register the DuskProvider inside our AppServiceProvider
```
/**
 * Register any application services.
 *
 * @return void
 */
public function register()
{
    if ($this->app->environment('local','testing environment name'){
      $this->app->register(\Laravel\Dusk\DuskServiceProvider);
    }
}
```

Install Dusk
`php artisan dusk:install`

In DuskTestCase class change driver() method:
```php
$options = (new ChromeOptions)->addArguments([
    '--disable-gpu',
    '--headless',
    '--no-sandbox',
    '--ignore-ssl-errors',
    '--whitelisted-ips=""'
]);

return RemoteWebDriver::create(
    'http://selenium:4444/wd/hub', DesiredCapabilities::chrome()->setCapability(
    ChromeOptions::CAPABILITY, $options
));
```

#### Check Dusk

In ExampleTest add this assertion:
```php
$this->browse(function (Browser $browser) {
    $browser->visit('/')
            ->assertSee('Laravel');
});
```

And run `../artisan dusk`
