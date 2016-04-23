class Activity < ActiveRecord::Base
  belongs_to :site
  belongs_to :actor, class_name: "Account", foreign_key: :actor_id
end
