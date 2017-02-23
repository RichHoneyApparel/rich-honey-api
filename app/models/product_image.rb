class ProductImage < ActiveRecord::Base
  belongs_to :product, foreign_key: :product_id
end
