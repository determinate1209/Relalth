class Menu < ApplicationRecord
  belongs_to :plan
  belongs_to :customer
  
  has_many :menu_items
  has_many :comments
 
  
end
