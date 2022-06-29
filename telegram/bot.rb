require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'
require 'pg'

Dotenv.load('token.env')
token = ENV.fetch('TOKEN', nil)

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    chat_id = message.chat.id

    # rubocop:disable
    if message.is_a?(Telegram::Bot::Types::Message)
      # rubocop:enable
      command, text = message.text&.match(%r{/(\S+)\s*(.*)})&.captures
      case command
      # rubocop:disable Style/HashSyntax
      when 'start'
        bot.api.send_message(chat_id: chat_id,
                             text:    "Привет, #{message.from.first_name}. Зарегестрируйся на сайте (localhost:3000). Твой id Телеграм чата #{chat_id}")
      when command
        group = Group.find_by(name: command, chat_id: Chat.find_by(chat_id:)&.id)
        bot.api.send_message(chat_id: chat_id, text: "#{group.nickname} #{text}") if group
      end
      # rubocop:enable Style/HashSyntax
    end
  end
end
