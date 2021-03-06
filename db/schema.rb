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

ActiveRecord::Schema.define(version: 20170320030240) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category"
    t.string   "title"
    t.text     "desc",       limit: 65535
    t.string   "link_name"
    t.boolean  "enable",                   default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "hidden",                   default: false
  end

  create_table "meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.text     "desc",       limit: 65535
    t.text     "keywords",   limit: 65535
    t.string   "image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["event_id"], name: "index_meta_on_event_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "desc",         limit: 65535
    t.text     "url",          limit: 65535
    t.integer  "index"
    t.string   "banner"
    t.integer  "event_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "banner_style",               default: 1
    t.boolean  "hidden",                     default: false
    t.index ["event_id"], name: "index_products_on_event_id", using: :btree
  end

  add_foreign_key "meta", "events"
  add_foreign_key "products", "events"
end
