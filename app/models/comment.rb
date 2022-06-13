class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :menu
  
  validates :comment, presence: true
end
