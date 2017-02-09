class Product < ActiveRecord::Base
  has_one :product_property
  has_many :product_production_statuses

  accepts_nested_attributes_for :product_property, :product_production_statuses
end
