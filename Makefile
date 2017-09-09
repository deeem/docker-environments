# If the first agrument is "artisan"
ifeq (artisan,$(firstword $(MAKECMDGOALS)))
# use the rest arguments for "artisan"
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
# ... and turn them into do-nothing targets
$(eval $(RUN_ARGS)::;@)
endif

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
artisan:
	docker-compose -f docker/docker-compose.yml exec app php artisan $(RUN_ARGS)
