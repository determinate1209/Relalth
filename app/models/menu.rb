class Menu < ApplicationRecord
  belongs_to :customer
  
  has_many :menu_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  enum plan_name: { leg_pain: 0,
                    leg_fatigue: 1, 
                    knee_pain: 2, 
                    knee_fatigue: 3, 
                    waist_pain: 4, 
                    waist_fatigue: 5, 
                    shoulder_pain: 6,
                    shoulder_fatigue: 7,
                    body_pain: 8,
                    body_fatigue:9}
                    
  enum site_name: { neck: 0,
                    shoulder: 1,
                    waist: 2,
                    knee: 3,
                    leg: 4}
  
  validates :name, presence: true
  validates :description, presence: true
  
  def bookmarked_by?(customer)
    bookmarks.exists?(customer_id: customer.id)
  end
  
  
end
