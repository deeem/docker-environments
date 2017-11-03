run:
	docker run -d -p 8080:8000 -v `pwd`:/app --name=php-http -e XDEBUG_CONFIG="remote_host=192.168.1.6" deeem/php-http
install:
	docker run --rm -v `pwd`:/app composer/composer install
autoload:
	docker run --rm -v `pwd`:/app composer/composer dump-autoload
lint:
	docker exec -it php-http php /app/vendor/bin/phpcs --standard=PSR2 /app/src /app/tests
test:
	docker exec php-http php /app/vendor/bin/phpunit

