class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Slug
      t.jsonb :slug, null: false, default: "{}"

      t.string :name
      t.jsonb :template, null: false, default: "{}"

      t.timestamps null: false
    end

    add_foreign_key :snippets, :sites
  end
end
