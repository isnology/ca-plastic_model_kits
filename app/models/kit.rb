class Kit < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :scale, presence: true
  validates :subject, presence: true
  validates :price, numericality: { greater_than: 0.00}
  
end
