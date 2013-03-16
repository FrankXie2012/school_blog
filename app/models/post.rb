class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
  attr_accessible :content, :title, :user_id

  validates :content, :title, presence: true
end
