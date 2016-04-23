class CreateContentEntries < ActiveRecord::Migration
  def change
    create_table :content_entries, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Userstamp
      t.uuid :created_by_id
      t.uuid :updated_by_id

      # SEO
      t.jsonb :seo_title, null: false, default: "{}"
      t.jsonb :meta_keywords, null: false, default: "{}"
      t.jsonb :meta_description, null: false, default: "{}"

      # Slug
      t.jsonb :_slug, null: false, default: "{}"

      # Localized
      t.jsonb :_translated, null: false, default: "{}"

      # File Size
      t.integer :_file_size, default: 0

      t.integer :_position, default: 0
      t.boolean :_visible, default: true
      t.uuid :content_type_id

      t.timestamps null: false
    end

    add_foreign_key :content_entries, :sites
    add_foreign_key :content_entries, :accounts, column: :created_by_id
    add_foreign_key :content_entries, :accounts, column: :updated_by_id
    add_foreign_key :content_entries, :content_types
  end
end
