class ProductCategory < ApplicationRecord
	has_many :products, inverse_of: :product_category, dependent: :destroy
end
