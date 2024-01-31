class AddChatReferenceToReminder < ActiveRecord::Migration[7.0]
  def change
    remove_column :reminders, :chat_id
    remove_column :reminders, :setting_id
    add_reference :reminders, :chat, foreign_key: true
  end
end
