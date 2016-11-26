# HEXLET Student Evnironment CLI

## About
Окружение для прохождения курсов на hexlet.io.
Содержит:
- php 7
- composer
- phpcs
- phpunit
- psysh

## Requirements

- Docker

## Usage

Для исходного предназначена папка `src`, для тестов `tests`.

Для удобства использования создан Makefile.
- `make run some-script.php` - запускает скрипт в командной строке, из папки _src_
- `make install` - composer устанавливает зависимости, указанные в _composer.json_
- `make autoload` - аналог **composer dump-autoload**
- `make lint` - проверяет код на соответсвие стандарту _PSR-2_
- `make tests` - запускает тесты phpunit, с конфигурацией из _phpunit.xml.dist_
