class Article < ActiveRecord::Base
  has_many :posts
  validates :content, :presence => true
  validates :poster_id, :presence => true
  validates :title, :presence => true
end
