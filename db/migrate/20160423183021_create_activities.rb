class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities, id: :uuid do |t|
      t.string :key, null: false
      t.jsonb :parameters, null: false, default: "{}"
      t.uuid :site_id, null: false
      t.uuid :actor_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :activities, :sites
    add_foreign_key :activities, :accounts, column: :actor_id
  end
end
