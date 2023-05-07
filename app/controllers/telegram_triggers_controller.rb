# frozen_string_literal: true

# Purpose: Controller for telegram manual trigger
class TelegramTriggersController < ApplicationController
  def create
    reminder = Reminder.find(params[:reminder_id])

    reponse = Telegram::SendMessage.call(reminder)

    render json: { message: 'Reminder send successfully.', api_reponse: reponse }, status: :ok
  end
end
