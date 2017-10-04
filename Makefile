up:
	docker-compose -f docker/docker-compose.yml up -d
down:
	docker-compose -f docker/docker-compose.yml down
laravel:
	docker run --rm -v `pwd`:/app -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro --user=`id -u` composer/composer create-project --prefer-dist laravel/laravel /app/laravel
install:
	docker run --rm -v `pwd`/laravel:/app composer/composer install
autoload:
	docker run --rm -v `pwd`/laravel:/app composer/composer dump-autoload
test:
	docker-compose -f docker/docker-compose.yml exec app php vendor/bin/phpunit
logs:
	docker-compose -f docker/docker-compose.yml logs --follow
