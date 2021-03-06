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

ActiveRecord::Schema.define(version: 20160423185025) do

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

  create_table "activities", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "key",                     null: false
    t.jsonb    "parameters", default: {}, null: false
    t.uuid     "site_id",                 null: false
    t.uuid     "actor_id",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "content_assets", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.string   "checksum"
    t.string   "content_type"
    t.integer  "width"
    t.integer  "height"
    t.integer  "size"
    t.integer  "position",     default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "content_entries", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.uuid     "created_by_id"
    t.uuid     "updated_by_id"
    t.jsonb    "seo_title",        default: {},   null: false
    t.jsonb    "meta_keywords",    default: {},   null: false
    t.jsonb    "meta_description", default: {},   null: false
    t.jsonb    "_slug",            default: {},   null: false
    t.jsonb    "_translated",      default: {},   null: false
    t.integer  "_file_size",       default: 0
    t.integer  "_position",        default: 0
    t.boolean  "_visible",         default: true
    t.uuid     "content_type_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "content_types", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.string   "entry_template"
    t.string   "public_submission_title_template"
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.uuid     "label_field_id"
    t.string   "label_field_name"
    t.uuid     "group_by_field_id"
    t.string   "order_by"
    t.string   "order_direction",                  default: "asc", null: false
    t.boolean  "public_submission_enabled",        default: false, null: false
    t.text     "public_submission_accounts",       default: [],                 array: true
    t.text     "filter_fields",                    default: [],                 array: true
    t.integer  "number_of_entries"
    t.jsonb    "display_settings",                 default: {},    null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "editable_controls", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "page_id"
    t.string   "slug"
    t.text     "block"
    t.string   "content"
    t.string   "hint"
    t.integer  "priority",        default: 0,     null: false
    t.boolean  "fixed",           default: false, null: false
    t.boolean  "disabled",        default: false, null: false
    t.boolean  "from_parent",     default: false, null: false
    t.text     "locales",         default: [],                 array: true
    t.boolean  "default_content", default: true,  null: false
    t.text     "options",         default: [],                 array: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "editable_files", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "page_id"
    t.string   "slug"
    t.text     "block"
    t.jsonb    "content",            default: {},    null: false
    t.string   "hint"
    t.integer  "priority",           default: 0,     null: false
    t.boolean  "fixed",              default: false, null: false
    t.boolean  "disabled",           default: false, null: false
    t.boolean  "from_parent",        default: false, null: false
    t.text     "locales",            default: [],                 array: true
    t.string   "source"
    t.jsonb    "default_source_url", default: {},    null: false
    t.string   "resize_format"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "editable_models", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "page_id"
    t.string   "slug"
    t.text     "block"
    t.jsonb    "content",     default: {},    null: false
    t.string   "hint"
    t.integer  "priority",    default: 0,     null: false
    t.boolean  "fixed",       default: false, null: false
    t.boolean  "disabled",    default: false, null: false
    t.boolean  "from_parent", default: false, null: false
    t.text     "locales",     default: [],                 array: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "editable_texts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "page_id"
    t.string   "slug"
    t.text     "block"
    t.jsonb    "content",         default: {},     null: false
    t.string   "hint"
    t.integer  "priority",        default: 0,      null: false
    t.boolean  "fixed",           default: false,  null: false
    t.boolean  "disabled",        default: false,  null: false
    t.boolean  "from_parent",     default: false,  null: false
    t.text     "locales",         default: [],                  array: true
    t.boolean  "default_content", default: true,   null: false
    t.string   "format",          default: "html", null: false
    t.integer  "rows",            default: 15,     null: false
    t.boolean  "inline",          default: false,  null: false
    t.boolean  "line_break",      default: true,   null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "memberships", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "account_id"
    t.uuid     "site_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["account_id", "site_id"], name: "index_memberships_on_account_id_and_site_id", unique: true, using: :btree

  create_table "pages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.uuid     "created_by_id"
    t.uuid     "updated_by_id"
    t.jsonb    "slug",                    default: {},          null: false
    t.jsonb    "seo_title",               default: {},          null: false
    t.jsonb    "meta_keywords",           default: {},          null: false
    t.jsonb    "meta_description",        default: {},          null: false
    t.uuid     "parent_id"
    t.integer  "position",                                      null: false
    t.integer  "depth",                   default: 0,           null: false
    t.boolean  "is_layout",               default: false,       null: false
    t.boolean  "allow_layout",            default: true,        null: false
    t.uuid     "layout_id"
    t.boolean  "templatized",             default: false,       null: false
    t.boolean  "templatized_from_parent", default: false,       null: false
    t.string   "target_klass_name"
    t.boolean  "redirect",                default: false,       null: false
    t.jsonb    "redirect_url",            default: {},          null: false
    t.integer  "redirect_type",           default: 301,         null: false
    t.boolean  "listed",                  default: true,        null: false
    t.jsonb    "title",                   default: {},          null: false
    t.jsonb    "fullpath",                default: {},          null: false
    t.string   "handle"
    t.jsonb    "raw_template",            default: {},          null: false
    t.text     "locales",                 default: [],                       array: true
    t.boolean  "published",               default: false,       null: false
    t.boolean  "cache_enabled",           default: true,        null: false
    t.string   "response_type",           default: "text/html", null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
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

  create_table "snippets", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.jsonb    "slug",       default: {}, null: false
    t.string   "name"
    t.jsonb    "template",   default: {}, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "theme_assets", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.string   "checksum"
    t.string   "local_path"
    t.string   "content_type"
    t.integer  "width"
    t.integer  "height"
    t.integer  "size"
    t.string   "folder"
    t.string   "source"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "translations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "site_id"
    t.uuid     "created_by_id"
    t.uuid     "updated_by_id"
    t.string   "key",                        null: false
    t.jsonb    "values",        default: {}, null: false
    t.integer  "completion",    default: 0,  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_foreign_key "activities", "accounts", column: "actor_id"
  add_foreign_key "activities", "sites"
  add_foreign_key "content_assets", "sites"
  add_foreign_key "content_entries", "accounts", column: "created_by_id"
  add_foreign_key "content_entries", "accounts", column: "updated_by_id"
  add_foreign_key "content_entries", "content_types"
  add_foreign_key "content_entries", "sites"
  add_foreign_key "content_types", "sites"
  add_foreign_key "editable_controls", "pages"
  add_foreign_key "editable_files", "pages"
  add_foreign_key "editable_models", "pages"
  add_foreign_key "editable_texts", "pages"
  add_foreign_key "memberships", "accounts"
  add_foreign_key "memberships", "sites"
  add_foreign_key "pages", "accounts", column: "created_by_id"
  add_foreign_key "pages", "accounts", column: "updated_by_id"
  add_foreign_key "pages", "pages", column: "layout_id"
  add_foreign_key "pages", "pages", column: "parent_id"
  add_foreign_key "pages", "sites"
  add_foreign_key "sites", "accounts", column: "created_by_id"
  add_foreign_key "snippets", "sites"
  add_foreign_key "theme_assets", "sites"
  add_foreign_key "translations", "accounts", column: "created_by_id"
  add_foreign_key "translations", "accounts", column: "updated_by_id"
  add_foreign_key "translations", "sites"
end
