class Product < ActiveRecord::Base
  has_many :product_production_status
  has_one :product_property

  accepts_nested_attributes_for :product_production_status, :product_property
end
