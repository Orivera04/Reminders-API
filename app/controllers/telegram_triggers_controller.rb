class TelegramTriggersController < ApplicationController

  def create
    reminder = Reminder.find_by(id: params[:reminder_id])
    reponse = TelegramMessage.call(reminder)

    render json: { message: "Reminder send successfully.", api_reponse: reponse }, status: :ok
  end

end
