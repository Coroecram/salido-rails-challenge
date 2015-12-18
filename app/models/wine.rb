class Wine < ActiveRecord::Base
  validates :name, :url, :min_price, :max_price, :retail_price, :kind, presence: true
  validates :name, :url, uniqueness: true
end
