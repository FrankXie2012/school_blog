class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	belongs_to :user
  attr_accessible :content, :title, :user_id, :comments_count

  validates :content, :title, presence: true
  paginates_per 12

  scope :with_user_name, ->(keyword){
    joins(:user).where{users.name=~"%#{keyword.to_s}%"}
  }

  def username_with_title
    "#{self.user.name}: #{self.title}"
  end
end
