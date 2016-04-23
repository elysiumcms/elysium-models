class Page < ActiveRecord::Base
  belongs_to :site

  belongs_to :parent, class_name: "Page"
  has_many :children, class_name: "Page", foreign_key: "parent_id"
  belongs_to :layout, class_name: "Page"
  has_many :layout_children, class_name: "Page", foreign_key: "layout_id"
  belongs_to :created_by, class_name: "Account", foreign_key: :created_by_id
  belongs_to :updated_by, class_name: "Account", foreign_key: :updated_by_id
end
