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

ActiveRecord::Schema.define(version: 2019_08_13_131629) do

  create_table "bugs", force: :cascade do |t|
    t.integer "tester_id"
    t.integer "device_id"
    t.index ["device_id"], name: "index_bugs_on_device_id"
    t.index ["tester_id"], name: "index_bugs_on_tester_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "description"
  end

  create_table "tester_devices", force: :cascade do |t|
    t.integer "tester_id"
    t.integer "device_id"
    t.index ["device_id"], name: "index_tester_devices_on_device_id"
    t.index ["tester_id"], name: "index_tester_devices_on_tester_id"
  end

  create_table "testers", force: :cascade do |t|
    t.string "first_name", limit: 60
    t.string "last_name", limit: 60
    t.string "country", limit: 2
    t.datetime "last_login"
  end

end
