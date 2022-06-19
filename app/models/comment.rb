class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :menu
  
  validates :comment, presence: true,length: {maximum: 250}
end
