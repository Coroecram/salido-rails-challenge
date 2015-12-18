class Wine < ActiveRecord::Base
  validates :name, :url, :min_price, :max_price, :retail_price, :kind, presence: true
  validates :name, :url, uniqueness: true
  validates_numericality_of :min_price, :retail_price
  validates_numericality_of :max_price, :greater_than => :min_price
end
