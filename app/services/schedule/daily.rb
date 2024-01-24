# frozen_string_literal: true

# Module Schedule: This module is responsible of sending the reminders
module Schedule
  # This class is responsible of sending all the reminders of type daily
  class Daily < ApplicationService
    DAY = 0
    HOUR_OF_EXECUTION = 1

    def initialize(reminder)
      @reminder = reminder
      @current_hour = Time.now.strftime('%H:%M')
      @current_day = Date.today.strftime('%A').downcase
    end

    def call
      begin
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

    def execute
      reminder_schedules = @reminder.schedules

      return unless reminder_schedules.any? do |schedule|
        schedule[DAY] == @current_day && schedule[HOUR_OF_EXECUTION] == @current_hour
      end

      Telegram::SendMessage.call(@reminder)
    end
  end
end
