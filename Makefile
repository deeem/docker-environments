up:
	docker-compose -f docker/docker-compose.yml up -d
down:
	docker-compose -f docker/docker-compose.yml down
laravel:
	docker run --rm -v `pwd`:/app composer/composer create-project --prefer-dist laravel/laravel /app/laravel
install:
	docker run --rm -v `pwd`/laravel:/app composer/composer install
autoload:
	docker run --rm -v `pwd`/laravel:/app composer/composer dump-autoload
