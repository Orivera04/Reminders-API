class TelegramMessage < ApplicationService

  def initialize(reminder)
    configuration = Setting.first
    @reminder = reminder
    @base_endpoint = "https://api.telegram.org/bot#{configuration.token_bot_api}"
    @parse_mode = configuration.formatting_style.name
  end

  def call
    url = "#{@base_endpoint}/sendMessage"
    body = { chat_id: @reminder.chat_id, text: @reminder.message, parse_mode: @parse_mode }

    response = Faraday.post(url, body)

    response
  end

end