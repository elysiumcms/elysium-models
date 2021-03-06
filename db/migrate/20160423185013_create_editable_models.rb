class CreateEditableModels < ActiveRecord::Migration
  def change
    create_table :editable_models, id: :uuid do |t|
      t.uuid :page_id
      t.string :slug
      t.text :block
      t.jsonb :content, null: false, default: "{}"
      t.string :hint
      t.integer :priority, null: false, default: 0
      t.boolean :fixed, null: false, default: false
      t.boolean :disabled, null: false, default: false
      t.boolean :from_parent, null: false, default: false
      t.text :locales, array: true, default: []

      t.timestamps null: false
    end

    add_foreign_key :editable_models, :pages
  end
end
