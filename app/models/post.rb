class Post < ActiveRecord::Base
	has_many :comments
  attr_accessible :content, :title

  validates :content, :title, presence: true
end
