class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	belongs_to :user
  attr_accessible :content, :title, :user_id, :avatar, :avatar_cache

  validates :content, :title, presence: true
  mount_uploader :avatar, AvatarUploader

  def has_avatar
    self.avatar_url rescue nil
  end

  def username_with_title
    "#{self.user.name}: #{self.title}"
  end

  scope :with_post_title, ->(keyword){
    where{title=~"%#{keyword.downcase}%"}
  }

  scope :with_user_name, ->(keyword){
    joins(:users).where(users.name == keyword)
  }
end
