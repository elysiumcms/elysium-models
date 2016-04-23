class CreateThemeAssets < ActiveRecord::Migration
  def change
    create_table :theme_assets, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Checksum
      t.string :checksum

      t.string :local_path
      t.string :content_type
      t.integer :width
      t.integer :height
      t.integer :size
      t.string :folder
      t.string :source

      t.timestamps null: false
    end

    add_foreign_key :theme_assets, :sites
  end
end
