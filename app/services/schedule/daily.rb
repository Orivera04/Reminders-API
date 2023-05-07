# frozen_string_literal: true

# Module Schedule: This module is responsible of sending the reminders
module Schedule
  # This class is responsible of sending all the reminders of type daily
  class Daily < ApplicationService
    def initialize(reminder)
      @reminder = reminder
      @current_hour = Time.now.strftime('%H:%M')
      @current_day = Date.today.strftime('%u').to_i
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
      reminder_schedules = JSON.parse(@reminder.schedules)

      return unless reminder_schedules['schedules'].any? do |schedule|
        schedule['day'] == @current_day && schedule['hour_of_execution'] == @current_hour
      end

      Telegram::SendMessage.call(@reminder)
    end
  end
end
