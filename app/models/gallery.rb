class Gallery < ActiveRecord::Base
  attr_accessible :name, :picture_id, :maingall_id, :description
end
