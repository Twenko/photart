class Article < ActiveRecord::Base
  validates :content, :presence => true
  validates :poster_id, :presence => true
  validates :title, :presence => true
end
