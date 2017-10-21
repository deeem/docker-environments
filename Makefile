up:
	docker-compose up -d
down:
	docker-compose down
laravel:
	docker run --rm -v `pwd`:/app -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro --user=`id -u` composer/composer create-project --prefer-dist laravel/laravel /app/laravel
install:
	docker run --rm -v `pwd`/laravel:/app composer/composer install
autoload:
	docker run --rm -v `pwd`/laravel:/app composer/composer dump-autoload
test:
	docker-compose exec app php vendor/bin/phpunit
logs:
	docker-compose logs --follow
tinker:
	docker-compose exec app php artisan tinker

