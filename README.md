# PHP HTTP

## About
Docker-окружение использующее встроенный php-сервер.

Содержит:
- php 7
- composer
- phpcs
- phpunit
- xdebug

## Requirements

- Docker

## Running up

### Config

Все настройки выполняются в файле docker-compose.yml:

* изменить порт контейнера в секции `ports`, значение по умолчанию 8080 
* изменить путь рабочей директории web-сервера в секции `command`, значение по умолчанию `/app/src`
* eсли будет использоваться дебагинг, необходимо в переменной `XDEBUG_CONFIG="remote_host=192.168.1.6"` изменить ip-адрес на текущий локальный

### Install

 * установить зависимости `sh composer install`
 * запустить контейнер `docker-compose up -d`

## Usage

HTTP доступ **127.0.0.1:8080**

Исходный код размещать в  `src`, тесты в `tests`.

Управление контейнером:

* `docker-composer up -d` - запуск контейнера
* `docker-composer down` - остановка и удаление контейнера

Что еще в комплекте:

* `./phpunit`- запускает phpunit
* `./composer` - запускает composer
* `./composer phpcs` - проверяет код на соответствие стандарту _PSR-2_
* `./composer test` - запускает phpunit
* `./composer ci` - запускает phpcs и тесты

### Debug using PHPStorm

- в Google Chrome установить расширение [Xdebug Helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc)
- в PHPStorm `File` -> `Settings` -> `Language and Frameworks` -> `PHP` -> `Servers` -> `+` Указать `host: 127.0.0.1`, `port:8080`, замапить путь `src -> /app/src`
- в коде поставить точку останова
- в PHPStorm нажать на трубку `Run` -> `Start Listening for PHP Debug connection`
- в Google Chrome нажать на иконке установленного расширения и выбрать _Debug_
- перезагрузить страницу
