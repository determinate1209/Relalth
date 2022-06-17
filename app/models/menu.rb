class Menu < ApplicationRecord
  belongs_to :customer
  
  has_many :menu_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  enum plan_name: { pain: 0,
                    fatigue: 1}
                    
  enum site_name: { leg: 0,
                    knee: 1,
                    waist: 2,
                    shoulder: 3,
                    body: 4}
  
  validates :name, presence: true
  validates :description, presence: true
  
  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end
  
  
end
