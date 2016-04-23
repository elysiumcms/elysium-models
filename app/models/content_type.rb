class ContentType < ActiveRecord::Base
  belongs_to :site
  has_many :content_entries
end
