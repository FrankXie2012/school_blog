class User < ActiveRecord::Base
  require 'open-uri'
  require 'nokogiri'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name,
                  :gender, :motto, :hobby, :phone, :birthday, :classroom, :avatar,
                  :avatar_cache, :address

  paginates_per 10
  easy_roles :roles
  extend FriendlyId
  friendly_id :name
  mount_uploader :avatar, AvatarUploader
  validates :name, uniqueness: true
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  GENDER = [['Male', 0], ['Female', 1]].freeze

  def get_gender
    self.gender==true ? 'Female' : 'Male'
  end

  def has_avatar
    self.avatar_url rescue nil
  end

  def show_role
    self.roles == [] ? 'Common User' : self.roles.first.capitalize
  end

  def set_role
    self.has_role?('admin') ? self.remove_role('admin') : self.add_role('admin')
  end

  def get_school_news
    links = {}
    doc = Nokogiri::HTML(open('http://news.cslg.cn'))
    doc.css('#AutoNumber5 a').each do |link|
      links[link.content.to_s]||=[]
      links[link.content.to_s] << link['href']
    end
    links
  end
end