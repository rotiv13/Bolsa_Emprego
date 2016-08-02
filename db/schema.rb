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

ActiveRecord::Schema.define(version: 20160802104613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "summary"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "destaque"
    t.boolean  "active"
    t.string   "picture"
  end

  create_table "offer_relationships", force: :cascade do |t|
    t.integer  "cand_id"
    t.integer  "of_cand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cand_id", "of_cand_id"], name: "index_offer_relationships_on_cand_id_and_of_cand_id", unique: true, using: :btree
    t.index ["cand_id"], name: "index_offer_relationships_on_cand_id", using: :btree
    t.index ["of_cand_id"], name: "index_offer_relationships_on_of_cand_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.string   "date_begin"
    t.string   "date_end"
    t.text     "description"
    t.string   "prof_area"
    t.string   "type_contract"
    t.string   "salary"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",        default: false
    t.string   "picture"
    t.string   "locality"
    t.index ["user_id", "created_at"], name: "index_offers_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_offers_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
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
    t.string   "picture"
    t.string   "curriculum"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "offers", "users"
end
