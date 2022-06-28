require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'
require 'pg'

Dotenv.load('token.env')
token = ENV.fetch('TOKEN', nil)

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    chat = message.chat.id

    # rubocop:disable
    if message.is_a?(Telegram::Bot::Types::Message)
    # rubocop:enable
      command, text = message.text&.match(/\/(\S+)\s*(.*)/)&.captures
      case command
      when 'start'
        bot.api.send_message(chat_id: message.chat.id,
                            text:    "Привет, #{message.from.first_name}. Зарегестрируйся на сайте (localhost:3000). Твой id Телеграм чата #{message.chat.id}")
      when command
        if Group.find_by(name: command, chat_id: Chat.find_by(chat_id: chat)&.id)
          bot.api.send_message(chat_id: message.chat.id, text: "#{Group.find_by(name:    command,
                                                                                chat_id: Chat.find_by(chat_id: chat).id).nickname} #{text}")
        end
      end
    end
  end
end
