# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_31_162410) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "chat_id"
    t.bigint "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_chats_on_setting_id"
  end

  create_table "formatting_styles", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string "message", null: false
    t.bigint "type_schedule_id", null: false
    t.jsonb "schedules", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_id"
    t.index ["chat_id"], name: "index_reminders_on_chat_id"
    t.index ["type_schedule_id"], name: "index_reminders_on_type_schedule_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "token_bot_api", null: false
    t.bigint "formatting_style_id", null: false
    t.string "description"
    t.index ["formatting_style_id"], name: "index_settings_on_formatting_style_id"
  end

  create_table "type_schedules", force: :cascade do |t|
    t.string "name", null: false
  end

  add_foreign_key "chats", "settings"
  add_foreign_key "reminders", "chats"
end
