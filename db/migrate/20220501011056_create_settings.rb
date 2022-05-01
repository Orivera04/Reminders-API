class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :token_bot_api, null: false
      t.references :formatting_style, null: false
    end
  end
end
