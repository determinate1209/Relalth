class Menu < ApplicationRecord
  belongs_to :plan
  belongs_to :customer
  
  has_many :menu_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  
  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end
  
  
end
