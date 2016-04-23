class CreateContentTypes < ActiveRecord::Migration
  def change
    create_table :content_types, id: :uuid do |t|
      # Site Scope
      t.uuid :site_id

      # Entry Template
      t.string :entry_template

      # Public Submission Title Template
      t.string :public_submission_title_template

      t.string :name
      t.text :description
      t.string :slug
      t.uuid :label_field_id
      t.string :label_field_name
      t.uuid :group_by_field_id
      t.string :order_by
      t.string :order_direction, null: false, default: "asc"
      t.boolean :public_submission_enabled, null: false, default: false
      t.text :public_submission_accounts, array: true, default: []
      t.text :filter_fields, array: true, default: []
      t.integer :number_of_entries
      t.jsonb :display_settings, null: false, default: "{}"

      t.timestamps null: false
    end

    add_foreign_key :content_types, :sites
  end
end
