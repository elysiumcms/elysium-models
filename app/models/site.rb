class Site < ActiveRecord::Base
  has_many :pages
  has_many :snippets
  has_many :theme_assets
  has_many :content_assets
  has_many :content_types
  has_many :content_entries
  has_many :translations
  has_many :activities
  has_many :memberships
  has_many :account, through: :memberships

  belongs_to :created_by, class_name: "Account", foreign_key: :created_by_id
end
