class Site < ActiveRecord::Base
  belongs_to :created_by, class_name: "Account", foreign_key: :created_by_id
end
