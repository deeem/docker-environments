# PHP CLI

## About

Contains:
- php 7
- composer
- phpcs
- phpunit
- psysh

## Requirements

- Docker

## Usage

Put your source code in to `src`, tests in `tests`.

Use Makefile for:
- `make run some-script.php` - runs php script from _src_ directory
- `make install` - composer install that uses _composer.json_
- `make autoload` - composer dump-autoload
- `make lint` - phpcs lint your code with _PSR-2_ standards
- `make tests` -  phpunit runs test using _phpunit.xml.dist_
