# frozen_string_literal: true

# Purpose: Controller for chat
class ChatsController < ApplicationController
  def index
    chats = Chat.all
    render json: chats, status: :ok
  end

  def show
    chat = Chat.find_by(id: params[:id])

    if chat
      render json: chat, status: :ok
    else
      render json: { error: 'Chat not found.'}, status: :not_found
    end
  end

  def create
    chat = Chat.new(chats_params)

    if chat.save!
      render json: { message: 'Chat created successfully.', record: chat  }, status: :ok
    else
      render json: { error: 'Error creating chat.', record: chat }, status: :bad_request
    end
  end

  def update
    chat = Chat.find_by(id: params[:id])
    chat.attributes = chats_params || {}

    if chat.save!
      render json: { message: 'Chat updated successfully.', record: chat }, status: :ok
    else
      render json: { error: 'Error updating chat.', record: chat }, status: :bad_request
    end
  end

  def destroy
    chat = Chat.find_by(id: params[:id])

    if chat.destroy!
      render json: { message: 'Chat deleted successfully.', record: chat }, status: :ok
    else
      render json: { error: 'Error deleting chat.', record: chat }, status: :bad_request
    end
  end

  private

  def chats_params
    params.permit(:name, :description, :setting_id, :chat_id)
  end
end
