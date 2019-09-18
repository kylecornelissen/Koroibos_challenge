# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_18_060801) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "medals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "olympian_events", force: :cascade do |t|
    t.integer "olympian_id"
    t.integer "event_id"
    t.integer "medal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_olympian_events_on_event_id"
    t.index ["medal_id"], name: "index_olympian_events_on_medal_id"
    t.index ["olympian_id"], name: "index_olympian_events_on_olympian_id"
  end

  create_table "olympians", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.integer "age"
    t.string "sex"
    t.integer "weight"
    t.string "sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
