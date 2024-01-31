class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.string :description
      t.string :chat_id
      t.references :setting, foreign_key: true
      t.timestamps
    end
  end
end
