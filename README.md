# Телеграм бот "Гермес"

  Проект состоит из 2х частей:
  - телеграм бот;
  - личный кабинет

  Принцип работы: 
  - администратор добавляет бота в чат;
  - переходит по ссылке от бота в личный кабинет и регистрируется;
  - создает группы участников для нужного чата;
  - радуется, что может вызвать нужных людей одной командой в чате.

## Установка / С чего начать

```shell
bundle
rails db:create db:migrate
rails server
```
В другом окне терминала

```shell
ruby telegram/bot.rb
```

Зайди в нужный Телеграм чат и напиши /start.

Первой командой будут установлены все гемы. Второй будут создана база данных. Третьей будет запущен сервер личного кабинета. Четвертой будет запущен Телеграм бот. После /start выведется ссылка на сайт регистрации и id чата.


### Начальная конфигурация

Напиши @botfather в Телеграме. Создай бота и получи токен.
Чтобы запустить бота вставь токен (полученный от @botfather) в файл token.env.example, после чего удали расширение .example.

## Разработка

```shell
git clone https://gitlab.edu.rnds.pro/skurilova/germes.git
cd germes
```

Будет склонирован проект в папку, после чего необходимо открыть проект в среде разработки.

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
