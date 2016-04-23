class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites, id: :uuid do |t|
      # SEO
      t.jsonb :seo_title, null: false, default: "{}"
      t.jsonb :meta_keywords, null: false, default: "{}"
      t.jsonb :meta_description, null: false, default: "{}"

      # Access Points
      t.string :handle
      t.text :domains, array: true, default: []
      t.boolean :redirect_to_first_domain, null: false, default: false

      # Locales
      t.text :locales, array: true, default: []
      t.boolean :prefix_default_locale, null: false, default: false

      # Timezone
      t.string :timezone_name, null: false, default: "UTC"

      # Cache
      t.boolean :cache_enabled, null: false, default: false
      t.datetime :template_version
      t.datetime :content_version

      # Url Redirections
      t.text :url_redirections, array: true, default: []

      # Private Access
      t.boolean :private_access, null: false, default: false
      t.string :password

      # Metafields
      t.jsonb :metafields, null: false, default: {}
      t.text :metafields_schema, array: true, default: []
      t.jsonb :metafields_ui, null: false, default: {}

      t.string :name
      t.string :robots_txt
      t.string :picture
      t.uuid :created_by_id

      t.timestamps null: false
    end

    add_foreign_key :sites, :accounts, column: :created_by_id
  end
end
