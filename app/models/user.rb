class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
                  :gender, :motto, :hobby, :phone, :birthday, :classroom

  validates :name, presence: true
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  GENDER = [['Male', 0], ['Female', 1]].freeze

  def get_gender
    self.gender==true ? 'Female' : 'Male'
  end
end