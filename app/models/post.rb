class Post < ActiveRecord::Base
  belongs_to :article
  #equivalent to comments
  #adorus => true if admin posting / false if user posting
  validates :context, :presence => true
  validates :poster_id, :presence => true
  #validates :adorus, :presence => true
  #if adorus is not "entered" or wrong, it will necessarily be false (0) in db
  validates :article_id, :presence => true
end
