class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :name, :post_id

  validates :body, :name, presence: true
end
