class City < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :zip_code, presence: true
end
