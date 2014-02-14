class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login
  
  has_many :pictures
  
  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(nick) = lower(:value) OR lower(email) = lower(:value)", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end
  
  validates :nick,
  :uniqueness => {
                   :case_sensitive => false
                 }
  validates :nick, :presence => true
end
