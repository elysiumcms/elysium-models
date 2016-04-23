class ContentEntry < ActiveRecord::Base
  belongs_to :site
  belongs_to :content_type

  belongs_to :created_by, class_name: "Account", foreign_key: :created_by_id
  belongs_to :updated_by, class_name: "Account", foreign_key: :updated_by_id
end
