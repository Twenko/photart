class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login
  #has_many :pictures
  has_many :posts

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = lower(:value) OR lower(email) = lower(:value)", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end
  
  before_validation {|u| u.username.downcase! }
  
  validates :username,
            :exclusion => { :in => ["khin"]}

  validates :username, :presence => true

  validates :username,
  :uniqueness => {
                   :case_sensitive => false
                 }
end
