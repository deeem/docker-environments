run:
	docker run --rm -v `pwd`:"/app" -w="/app/src" php php $(file) #example make run file=some-script.php
install:
	docker run --rm -v `pwd`:/app composer/composer install
autoload:
	docker run --rm -v `pwd`:/app composer/composer dump-autoload
lint:
	docker run --rm -v `pwd`:/app php php /app/vendor/bin/phpcs --standard=PSR2 /app/src /app/tests

