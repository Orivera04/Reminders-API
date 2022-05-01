class CreateFormattingStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :formatting_styles do |t|
      t.string :name, null: false
    end
  end
end
