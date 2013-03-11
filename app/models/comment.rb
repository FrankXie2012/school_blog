class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :name

  validates :body, :name, presence: true
end
