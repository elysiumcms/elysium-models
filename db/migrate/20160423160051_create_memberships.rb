class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships, id: :uuid do |t|
      t.uuid :account_id
      t.uuid :site_id
      t.string :role

      t.timestamps null: false
    end

    add_index :memberships, [:account_id, :site_id], unique: true

    add_foreign_key :memberships, :accounts
    add_foreign_key :memberships, :sites
  end
end
