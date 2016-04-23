class CreateEditableTexts < ActiveRecord::Migration
  def change
    create_table :editable_texts, id: :uuid do |t|
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

      t.boolean :default_content, null: false, default: true
      t.string :format, null: false, default: "html"
      t.integer :rows, null: false, default: 15
      t.boolean :inline, null: false, default: false
      t.boolean :line_break, null: false, default: true

      t.timestamps null: false
    end

    add_foreign_key :editable_texts, :pages
  end
end
