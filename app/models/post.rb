class Post < ActiveRecord::Base
  #equivalent to comments
  #adorus => true if admin posting / false if user posting
  validates :context, :presence => true
  validates :poster_id, :presence => true
  validates :adorus, :presence => true
end
