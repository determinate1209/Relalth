class Plan < ApplicationRecord
  has_many :menus, dependent: :destroy
end
