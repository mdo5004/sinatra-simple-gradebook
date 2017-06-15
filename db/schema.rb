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

ActiveRecord::Schema.define(version: 20170605125011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string  "name"
    t.integer "klass_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "classification"
    t.string   "manufacturer"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "klasses", force: :cascade do |t|
    t.string  "description"
    t.integer "teacher_id"
    t.string  "name"
  end

  create_table "rig_items", force: :cascade do |t|
    t.integer  "rig_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rigs", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "venue"
    t.string   "use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_assignments", force: :cascade do |t|
    t.integer "assignment_id"
    t.integer "student_id"
    t.float   "grade"
  end

  create_table "student_klasses", force: :cascade do |t|
    t.integer "klass_id"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "grade"
    t.string  "parent_guardian1"
    t.string  "parent_guardian2"
    t.string  "address"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "location"
    t.string   "title"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.bigint   "uid"
    t.string   "first_name"
    t.string   "last_name"
  end

end
