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

ActiveRecord::Schema.define(version: 20160725090054) do

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "summary"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "destaque"
    t.boolean  "active"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                                                                                             null: false
    t.datetime "updated_at",                                                                                                             null: false
    t.string   "password_digest"
    t.string   "entitie"
    t.text     "address"
    t.string   "postal_code"
    t.string   "locality"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "page"
    t.date     "birth_date"
    t.string   "idnum"
    t.string   "prof_area"
    t.text     "presentation"
    t.string   "skill_level"
    t.text     "skills"
    t.string   "prof_situation"
    t.text     "prof_experience"
    t.string   "remember_digest"
    t.string   "picture",           default: "https://rohttp://www.iconsfind.com/wp-content/uploads/2015/08/20150831_55e46b18e2a80.png"
    t.string   "curriculum"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
