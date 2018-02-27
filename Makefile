lint:
	docker exec -it php-http php /app/vendor/bin/phpcs --standard=PSR2 /app/src /app/tests
up:
	docker-compose up -d
down:
	docker-compose down

