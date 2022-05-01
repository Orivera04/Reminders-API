class CreateConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations do |t|
      t.string :token_bot_api, null: false
      t.references :mark_down_style, null: false
    end
  end
end
