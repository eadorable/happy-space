
ActiveRecord::Schema[7.0].define(version: 2024_01_14_144405) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "consent_agreed"
    t.string "control_number"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "parent_id", null: false
    t.integer "number_of_kids"
    t.integer "number_of_hours"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.boolean "open_time"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["parent_id"], name: "index_plays_on_parent_id"
  end

  add_foreign_key "plays", "parents"
end
