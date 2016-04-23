# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160423133924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "invitation_token"
    t.string   "api_key"
    t.string   "avatar"
    t.string   "name"
    t.string   "locale"
    t.boolean  "super_admin",            default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "sites", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.jsonb    "seo_title",                default: {},    null: false
    t.jsonb    "meta_keywords",            default: {},    null: false
    t.jsonb    "meta_description",         default: {},    null: false
    t.string   "handle"
    t.text     "domains",                  default: [],                 array: true
    t.boolean  "redirect_to_first_domain", default: false, null: false
    t.text     "locales",                  default: [],                 array: true
    t.boolean  "prefix_default_locale",    default: false, null: false
    t.string   "timezone_name",            default: "UTC", null: false
    t.boolean  "cache_enabled",            default: false, null: false
    t.datetime "template_version"
    t.datetime "content_version"
    t.text     "url_redirections",         default: [],                 array: true
    t.boolean  "private_access",           default: false, null: false
    t.string   "password"
    t.jsonb    "metafields",               default: {},    null: false
    t.text     "metafields_schema",        default: [],                 array: true
    t.jsonb    "metafields_ui",            default: {},    null: false
    t.string   "name"
    t.string   "robots_txt"
    t.string   "picture"
    t.uuid     "created_by_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "sites", "accounts", column: "created_by_id"
end
