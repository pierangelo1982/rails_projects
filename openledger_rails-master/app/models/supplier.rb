class Supplier < ApplicationRecord
	#has_many :products, inverse_of: :supplier
	has_many :products, inverse_of: :supplier, dependent: :destroy
end



