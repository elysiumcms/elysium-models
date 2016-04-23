class Account < ActiveRecord::Base
  has_many :memberships
  has_many :account, through: :memberships

  has_many :created_sites, class_name: "Site", foreign_key: :created_by_id
  has_many :created_pages, class_name: "Page", foreign_key: :created_by_id
  has_many :updated_pages, class_name: "Page", foreign_key: :updated_by_id
  has_many :created_content_entries, class_name: "ContentEntry", foreign_key: :created_by_id
  has_many :updated_content_entries, class_name: "ContentEntry", foreign_key: :updated_by_id
  has_many :created_translations, class_name: "Translation", foreign_key: :created_by_id
  has_many :updated_translations, class_name: "Translation", foreign_key: :updated_by_id
  has_many :created_activities, class_name: "Activity", foreign_key: :actor_id
end
