class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Userstamp
      t.uuid :created_by_id
      t.uuid :updated_by_id

      # Slug
      t.jsonb :slug, null: false, default: "{}"

      # SEO
      t.jsonb :seo_title, null: false, default: "{}"
      t.jsonb :meta_keywords, null: false, default: "{}"
      t.jsonb :meta_description, null: false, default: "{}"

      # Tree
      t.uuid :parent_id
      t.integer :position, null: false
      t.integer :depth, null: false, default: 0

      # Layout
      t.boolean :is_layout, null: false, default: false
      t.boolean :allow_layout, null: false, default: true
      t.uuid :layout_id

      # Templatized
      t.boolean :templatized, null: false, default: false
      t.boolean :templatized_from_parent, null: false, default: false
      t.string :target_klass_name

      # Redirect
      t.boolean :redirect, null: false, default: false
      t.jsonb :redirect_url, null: false, default: "{}"
      t.integer :redirect_type, null: false, default: 301

      # Listed
      t.boolean :listed, null: false, default: true

      t.jsonb :title, null: false, default: "{}"
      t.jsonb :slug, null: false, default: "{}"
      t.jsonb :fullpath, null: false, default: "{}"
      t.string :handle
      t.jsonb :raw_template, null: false, default: "{}"
      t.text :locales, array: true, default: []
      t.boolean :published, null: false, default: false
      t.boolean :cache_enabled, null: false, default: true
      t.string :response_type, null: false, default: "text/html"

      t.timestamps null: false
    end

    add_foreign_key :pages, :sites
    add_foreign_key :pages, :accounts, column: :created_by_id
    add_foreign_key :pages, :accounts, column: :updated_by_id
    add_foreign_key :pages, :pages, column: :parent_id
    add_foreign_key :pages, :pages, column: :layout_id
  end
end
