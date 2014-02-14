class Maingall < ActiveRecord::Base
  has_many :galleries
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
