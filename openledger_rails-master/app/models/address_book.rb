class AddressBook < ApplicationRecord
  has_many :address_book_banks, inverse_of: :address_book, dependent: :destroy
  accepts_nested_attributes_for :address_book_banks, :reject_if => :all_blank, :allow_destroy => true
end
