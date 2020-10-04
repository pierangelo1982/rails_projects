class VehicleCardAcceptance < ApplicationRecord
  belongs_to :employee
  belongs_to :address_book

  has_many :spare_parts, inverse_of: :vehicle_card_acceptance, dependent: :destroy
  accepts_nested_attributes_for :spare_parts, :reject_if => :all_blank, :allow_destroy => true
end
