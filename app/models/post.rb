class Post < ActiveRecord::Base
  #adorus => true if admin posting / false if user posting
  validates :context, :presence => true
  validates :context, :uniqueness => true
end
