class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      # Site Scope
      t.uuid :site_id

      # Userstamp
      t.uuid :created_by_id
      t.uuid :updated_by_id

      t.string :key, null: false
      t.jsonb :values, null: false, default: "{}"
      t.integer :completion, null: false, default: 0
      
      t.timestamps null: false
    end

    add_foreign_key :translations, :sites
    add_foreign_key :translations, :accounts, column: :created_by_id
    add_foreign_key :translations, :accounts, column: :updated_by_id
  end
end
