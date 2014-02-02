class Gallery < ActiveRecord::Base
  attr_accessible :name, :picture_id, :maingall_id, :description, :maingall,:activate
  has_many :pictures
  belongs_to :maingall
end
