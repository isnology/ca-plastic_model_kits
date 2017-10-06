class Kit < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :scale, presence: true
  validates :subject, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  
end
