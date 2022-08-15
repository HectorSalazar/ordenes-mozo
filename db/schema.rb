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

ActiveRecord::Schema[7.0].define(version: 2022_08_15_063620) do
  create_table "diningtables", force: :cascade do |t|
    t.integer "position"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hall_id", null: false
    t.index ["hall_id"], name: "index_diningtables_on_hall_id"
  end

  create_table "halls", force: :cascade do |t|
    t.integer "rows"
    t.integer "columns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "petitions", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plate_id", null: false
    t.integer "waiter_id", null: false
    t.integer "diningtable_id", null: false
    t.index ["diningtable_id"], name: "index_petitions_on_diningtable_id"
    t.index ["plate_id"], name: "index_petitions_on_plate_id"
    t.index ["waiter_id"], name: "index_petitions_on_waiter_id"
  end

  create_table "plates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waiters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "diningtables", "halls"
  add_foreign_key "petitions", "diningtables"
  add_foreign_key "petitions", "plates"
  add_foreign_key "petitions", "waiters"
end
