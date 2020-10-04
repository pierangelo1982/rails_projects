class SparePart < ApplicationRecord
  belongs_to :vehicle_card_acceptance, inverse_of: :spare_parts
  belongs_to :product
end
