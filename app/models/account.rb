class Account < ActiveRecord::Base
  has_many :created_sites, class_name: "Site", foreign_key: :created_by_id

  has_many :memberships
  has_many :account, through: :memberships
end
