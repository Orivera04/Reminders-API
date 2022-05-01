class CreateTypeSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :type_schedules do |t|
      t.string :name, null: false
    end
  end
end
