class Wine < ActiveRecord::Base
  validates :name, :min_price, :max_price, :retail_price, :kind, presence: true
  validates :name, :url, uniqueness: true
  validates_numericality_of :min_price, :max_price, :retail_price
  validates_numericality_of :max_price, :greater_than => :min_price,
                                        :unless => Proc.new {|wine| wine.max_price.nil? || wine.min_price.nil? }
end
