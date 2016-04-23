class CreateContentAssets < ActiveRecord::Migration
  def change
    create_table :content_assets, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Checksum
      t.string :checksum

      t.string :content_type
      t.integer :width
      t.integer :height
      t.integer :size
      t.integer :position, default: 0

      t.timestamps null: false
    end

    add_foreign_key :content_assets, :sites
  end
end
