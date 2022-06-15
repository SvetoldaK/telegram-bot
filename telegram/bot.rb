require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

Dotenv.load('token.env')
token = ENV.fetch('TOKEN', nil)

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if Message.exists?(telegram_id: message.from.id)
      Message.find_by(telegram_id: message.from.id)
    else
      Message.create(telegram_id: message.from.id, first_name: message.from.first_name)
    end
    message.inspect
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}")
    end
  end
end
