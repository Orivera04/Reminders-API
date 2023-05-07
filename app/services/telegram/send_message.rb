# frozen_string_literal: true

# Purpose: This module is responsible of handling the telegram services
module Telegram
  # This class is responsible of posting the reminders to telegram
  class SendMessage < ApplicationService

    def initialize(reminder)
      setting = reminder.setting
      @reminder = reminder
      @endpoint = "#{ENV['TELEGRAM_ENDPOINT']}/bot#{setting.token_bot_api}"
      @parse_mode = setting.formatting_style.name
    end

    def call
      begin
        set_body
        execute
      rescue StandardError => e
        telegram_logger ||= Logger.new("#{Rails.root}/log/telegram.log")

        telegram_logger.info "\n"
        telegram_logger.info "*****************************************************\n"
        telegram_logger.info "*       ERROR: SENDING MESSAGE                      *\n"
        telegram_logger.info "******************************************************\n"
        telegram_logger.info "-> Exception: #{e.message} \n"
        telegram_logger.info "-> BackTrace: #{e.backtrace.join("\n")} \n"
        telegram_logger.info "\n"

        nil
      end
    end

    def set_body
      @body = { chat_id: @reminder.chat_id, text: @reminder.message, parse_mode: @parse_mode }
    end

    def execute
      url = "#{@endpoint}/sendMessage"

      Faraday.post(url, @body)
    end
  end
end
