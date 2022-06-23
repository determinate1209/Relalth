class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :menus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_menus, through: :bookmarks, source: :menu
  
  validates :last_name, presence: true,length: {maximum: 50}
  validates :first_name, presence: true,length: {maximum: 50}
  validates :user_name, presence: true,length: {maximum: 50}, uniqueness: true
  
end
