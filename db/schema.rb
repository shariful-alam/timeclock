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

ActiveRecord::Schema.define(version: 2021_01_11_144543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "time_counts", force: :cascade do |t|
    t.datetime "punch_in_time"
    t.datetime "punch_out_time"
    t.boolean "active"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_time"
    t.index ["user_id"], name: "index_time_counts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.string "tracker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "time_counts", "users"
end
