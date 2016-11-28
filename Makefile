run:
	docker run -d -p 8080:8000 -v `pwd`:/app -w="/app" --name=hexlet-http deeem/hexlet-http php -S 0.0.0.0:8000 -t /app/src
install:
	docker run --rm -v `pwd`:/app composer/composer install
autoload:
	docker run --rm -v `pwd`:/app composer/composer dump-autoload
lint:
	docker exec -it hexlet-http php /app/vendor/bin/phpcs --standard=PSR2 /app/src /app/tests
test:
	docker exec hexlet-http php /app/vendor/bin/phpunit

