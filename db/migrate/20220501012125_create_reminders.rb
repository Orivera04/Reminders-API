class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :chat_id, null: false
      t.string :message, null: false
      t.references :type_schedule, null: false
      t.jsonb :schedules, null: false
      t.references :setting, foreign_key: true
      t.timestamps
    end
  end
end
