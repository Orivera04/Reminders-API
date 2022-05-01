class CreateMarkDownStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :mark_down_styles do |t|
      t.string :name, null: false
    end
  end
end
