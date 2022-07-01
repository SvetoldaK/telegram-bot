# Телеграм бот "Гермес"

  Проект состоит из 2х частей:
  - телеграм бот;
  - личный кабинет

  Принцип работы: 
  - администратор добавляет бота в чат;
  - в личном кабинете регистрируется, подключает по id Телеграм-чата бота;
  - создает группы участников;
  - радуется, что может вызвать нужных людей одной командой в чате.

## Установка / С чего начать

```shell
command bundle
command rails server
```
В другом окне терминала

```shell
command ruby telegram/bot.rb
```

Зайди в нужный Телеграм чат и напиши /start.

Первой командой будут установлены все гемы. Второй будет запущен сервер личного кабинета. Третьей будет запущен Телеграм бот. После /start выведется ссылка на сайт регистрации и id чата.


### Начальная конфигурация

Чтобы запустить бота вставь токен(полученный от @botfather) в файл token.env.example, после чего удали расширение .example.

## Разработка

```shell
git clone https://gitlab.edu.rnds.pro/skurilova/germes.git
cd <you_name_project>
```

Будет склонирован проект в папку с Вашим названием, после чего необходимо открыть проект в среде разработки.

### Сборка

```shell
sudo docker-compose build
```

Будет собран контейнер Docker

### Развертывание / Публикация


```shell
sudo docker-compose up
```

Будет запущенн контейнер Docker

## Features

* Создать группы участников
* Упоминать участников из созданных групп в чате

## Ссылки

- Репозиторий: https://gitlab.edu.rnds.pro/skurilova/germes
- Telegram Bot API: https://core.telegram.org/bots/api
- Используемые гемы:
  - Rubocop: https://github.com/rubocop/rubocop
  - Devise: https://github.com/heartcombo/devise
  - Telegram-bot-ruby: https://github.com/atipugin/telegram-bot-ruby
  - Dotenv: https://github.com/motdotla/dotenv
  - Bootstrap: https://github.com/twbs/bootstrap-rubygem
  - Rails i18n: https://guides.rubyonrails.org/i18n.html
  - Letter_opener_web: https://github.com/fgrehm/letter_opener_web
